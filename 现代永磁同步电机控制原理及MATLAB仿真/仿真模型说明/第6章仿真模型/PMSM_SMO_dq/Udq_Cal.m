syms u the thee
ua = u*sin(the);
ub = u*sin(the-2*pi/3);
uc = u*sin(the+2/3*pi);

ud = (ua*cos(thee)+ub*cos(thee-2*pi/3)+uc*cos(thee+2*pi/3))*2/3;
uq = -(ua*sin(thee)+ub*sin(thee-2*pi/3)+uc*sin(thee+2*pi/3))*2/3;

ude = simple(ud)
uqe = simple(uq)