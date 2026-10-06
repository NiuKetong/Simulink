	% inputs are magnitude u1(:) and angle u2(:);
	% Sector identification
	% n = Total simulation time / step size (integer value)

	function [sf]=six_step(u) 
	
	ts=0.0002;
    vdc=1;
    peak_phase_max = vdc/sqrt(3);
    
	x=u(2);
    m=1;
   	y=u(3);
	mag=m*(u(1)/peak_phase_max) * ts;
	
	if (x>=0) & (x<pi/3)
		ta = mag * ts;
		tb = 0;
		t0 =(ts-ta-tb);		
		t1=[t0/4 ta/2 tb/2 t0/2 tb/2 ta/2 t0/4];
		t1=cumsum(t1);
		v1=[1];
		v2=[0];
		v3=[0];		
		for j=1:1
			if(y<t1(j))
				break
			end
        end	
		sa=v1(j);
		sb=v2(j);
		sc=v3(j);
    end
	% sector II
	if (x>=pi/3) & (x<2*pi/3)

		adv= x-pi/3;
		
		tb = mag * ts;
		ta = 0;
		t0 =(ts-ta-tb);

		t1=[tb];
		t1=cumsum(t1);

		v1=[1];
		v2=[1];
		v3=[0];

	for j=1:1
	    if(y<t1(j))
	        break
	    end
	end

	sa=v1(j);
	sb=v2(j);
	sc=v3(j); 
	end
	%sector III

	if (x>=2*pi/3) & (x<pi)
		adv=x-2*pi/3;
		ta = mag * ts;
		tb = 0;
		t0 =(ts-ta-tb);

		t1=[ta];
		t1=cumsum(t1);
		v1=[0];
		v2=[1];
		v3=[0];
	
	for j=1:1
	    if(y<t1(j))
	        break
	    end
    end
	sa=v1(j);
	sb=v2(j);
	sc=v3(j);
    end
    
	%sector IV
	if (x>=-pi) & (x<-2*pi/3)
        adv = x  + pi; 
		tb= mag * ts;
		ta = 0;
		t0 =(ts-ta-tb);

		t1=[tb];
		t1=cumsum(t1);
	v1=[0];
	v2=[1];
	v3=[1];

	for j=1:1
	    if(y<t1(j))
	        break
	    end
	end

	sa=v1(j);
	sb=v2(j);
	sc=v3(j); 
    end
    	
	% sector V

	if (x>=-2*pi/3) & (x<-pi/3)

		adv = x+2*pi/3;

		ta = mag *ts;
		tb = 0;
		t0 =(ts-ta-tb);

		t1=[ta];
		t1=cumsum(t1);
		v1=[0];
		v2=[0];
		v3=[1];

	for j=1:1
	    if(y<t1(j))
	        break
	    end
	end

	sa=v1(j);
	sb=v2(j);
	sc=v3(j); 

end

	%Sector VI

	if (x>=-pi/3) & (x<0)
		adv = x+pi/3;		
		tb = mag * ts;
		ta = 0;
		t0 =(ts-ta-tb);

		t1=[tb];
		t1=cumsum(t1);
		v1=[1];
		v2=[0];
		v3=[1];
	
	for j=1:1
	    if(y<t1(j))
	        break
	    end
	end
	sa=v1(j);
	sb=v2(j);
	sc=v3(j);  
end	
sf=[sa, sb, sc]; 
