# VF_Speed Diagnostic Findings

The live, unsaved VF_Speed model was copied into an independent diagnostic
model. The original model's dirty flag, file name, callback, block parameters,
and MATLAB Function scripts were checked and preserved.

## Confirmed Control Error

`MATLAB Function1`, `MATLAB Function2`, and `MATLAB Function3` use
`phase = 2*pi*f(t)*t`. The commanded frequency is ramped at 100 Hz/s, so this
phase formula does not generate the commanded frequency.

In the continuous ramp approximation:

    actual_frequency = f(t) + t*df(t)/dt

For `f(t) = 100*t`, the actual frequency is approximately twice the commanded
frequency. The reference-voltage phase measurement in the diagnostic
simulation gave a ratio of 1.99993. Integrating `2*pi*f(t)` instead gave 0.99997.

The ramp finishes near 0.3333 s. The incorrect reference changes from about
66.67 Hz immediately before the end of the ramp to 33.33 Hz afterwards. Voltage
amplitude is still calculated using the lower commanded frequency, compounding
the startup problem.

With all other settings unchanged, the speed range at 0.35-0.40 s changed from
238.02-826.77 rpm to 472.84-519.74 rpm after correcting phase generation only.
Maximum absolute torque over the run changed from 65.67 to 17.38 N m.

## Confirmed Parameter Typo

The live salient-pole PMSM has `dqInductances = [Ld,Ld]`.

The initialization callback defines:

    Ld = 0.00525 H
    Lq = 0.012 H

The intended parameter expression is `[Ld,Lq]`. The existing expression
eliminates the intended d/q inductance difference. Correcting this changes the
physical motor model; it does not by itself guarantee better open-loop stability.

## Observation Window

The original stop time is 0.4 s, only about 0.0667 s after the frequency ramp
finishes. A 1.2 s diagnostic run of the otherwise unchanged original model
settled to a mean speed of 499.9998 rpm over 1.1-1.2 s. Its speed range in that
window was 498.60-500.75 rpm.

Thus the original model has a severe startup problem, but this test does not
support a claim that its speed diverges indefinitely.

## Numerical Resolution

PWM frequency is 10 kHz, so the carrier period is 100 us. The original powergui
electrical step is 5 us: 20 electrical-network update intervals per PWM period.

Using corrected phase generation and `[Ld,Lq]`, with all remaining physical and
control settings unchanged, the following step-size comparisons were run:

| powergui Step | Global MaxStep | Phase A RMS, 1.1-1.2 s | Torque Peak-to-Peak |
| --- | --- | --- | --- |
| 5 us | 10 us | 9.1047 A | 2.3754 N m |
| 1 us | 1 us | 13.2912 A | 0.9218 N m |
| 0.5 us | 0.5 us | 13.5222 A | 0.4766 N m |

The electrical step and global maximum step were changed together in these
tests. The results demonstrate significant sensitivity to numerical resolution,
not a fully isolated attribution to either individual setting. Torque ripple
continues to change, so a convergence tolerance should be specified before
claiming a final step size is adequate.

## Expected Steady State

The commanded electrical frequency is 100/3 Hz and the motor has four pole
pairs, giving a synchronous speed of 500 rpm.

Load torque steps to 10 N m at 0.2 s. With viscous friction B = 0.008 N m s/rad,
the expected steady electromagnetic torque is approximately:

    Te = 10 + 0.008*(500*pi/30) = 10.4189 N m

The 0.5 us diagnostic run gave a mean torque of 10.4177 N m.

## Recommended Correction Order

1. Generate electrical angle by integrating `2*pi*f(t)` and use the integrated
   angle in all three phase-reference functions.
2. Correct the motor d/q inductance parameter to `[Ld,Lq]`.
3. Extend simulation sufficiently beyond startup and load transients.
4. Reduce electrical/global step sizes and verify current, torque, and speed
   metrics converge to the required tolerance.

No correction was applied to the user's VF_Speed or original SVPWM model.
