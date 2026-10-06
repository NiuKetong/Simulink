	% inputs are magnitude u1(:) and angle u2(:);
	% Sector identification
	% n = Total simulation time / step size (integer value)

	function [sf]=over_modulation2(u)	
	ts=0.0002;	 
    vdc=1; 
    peak_phase_max = vdc/sqrt(3);
    
	x=u(2);       
   	y = u(3);
	mag = (u(1)/peak_phase_max) * ts;        
    MI=u(1)/((2/pi)*vdc);
% 
if  MI<0.98
    ah=(6.40*MI-6.09);
elseif MI<0.9975
    ah=(11.750*MI-11.34);
elseif MI<1
     ah=(48.96*MI-48.43);
 end
   
	if (x>=0) & (x<pi/3)
        ap = x/(1-6*ah/pi);  
        %--1
        if (x>=0) & (x<ah)
		ta = mag * ts;
		tb = 0;
		t0 =(ts-ta-tb);
		
		t1=[ta];
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
        %--2
        if (x>=ah) & (x<(pi/3-ah))
            
		tb = mag * sin(ap)/cos(pi/6-ap);
		ta = ts-tb;
		t0 = 0;
		
		t1=[ta/2 tb/2 tb/2 ta/2];
		t1=cumsum(t1);

		v1=[1 1 1 1];
		v2=[0 1 1 0];
		v3=[0 0 0 0];
		
		for j=1:4
			if(y<t1(j))
				break
			end
		end
	
		sa=v1(j);
		sb=v2(j);
		sc=v3(j); 

        end
        %--3
        if (x>=(pi/3-ah)) & (x<pi/3)
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
    end

	% sector II
	if (x>=pi/3) & (x<2*pi/3)

		adv= x-pi/3;     ap = adv/(1-6*ah/pi); 
        %--1
        if (adv>=0) & (adv<ah)
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
        %---2
        if (adv>=ah) & (adv<(pi/3-ah))            
		ta = mag * sin(ap)/cos(pi/6-ap);
		tb = ts-ta;
		t0 = 0;

		t1=[ta/2 tb/2 tb/2 ta/2];
		t1=cumsum(t1);

		v1=[0 1 1 0];
		v2=[1 1 1 1];
		v3=[0 0 0 0];

	    for j=1:4
	        if(y<t1(j))
	            break
	        end
	    end

	    sa=v1(j);
	    sb=v2(j);
	    sc=v3(j); 

	    end
        %---3
        if (adv>=(pi/3-ah)) & (adv<pi/3)
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
    end
    %----------------------------------------------------------------------
	%sector III

	if (x>=2*pi/3) & (x<pi)

		adv=x-2*pi/3;    ap = adv/(1-6*ah/pi); 
        %---1
        if (adv>=0) & (adv<ah)
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
        %---2
        if (adv>=ah) & (adv<(pi/3-ah))
		tb = mag * sin(ap)/cos(pi/6-ap);
		ta = ts-tb;
		t0 =0;
		t1=[ta/2 tb/2 tb/2 ta/2];
		t1=cumsum(t1);
		v1=[0 0 0 0];
		v2=[1 1 1 1];
		v3=[0 1 1 0];
	
	    for j=1:4
	        if(y<t1(j))
	            break
	        end
	    end

	    sa=v1(j);
	    sb=v2(j);
	    sc=v3(j); 

        end
        %---3
        if (adv>=(pi/3-ah)) & (adv<pi/3)
		tb = mag* ts;
		ta = mag * 0;
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
    end
    %----------------------------------------------------------------------
   	%sector IV

	if (x>=-pi) & (x<-2*pi/3)

        adv = x + pi;    ap = adv/(1-6*ah/pi); 
        %--1
        if (adv>=0) & (adv<ah)
		tb = mag* ts;
		ta = mag * 0;
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
	    %---2
        if (adv>=ah) & (adv<(pi/3-ah))
		ta = mag * sin(ap)/cos(pi/6-ap);
		tb = ts-ta;
		t0 = 0;

		t1=[ta/2 tb/2 tb/2 ta/2];
		t1=cumsum(t1);
	    v1=[0 0 0 0];
	    v2=[0 1 1 0];
	    v3=[1 1 1 1];

	    for j=1:7
	        if(y<t1(j))
	            break
	        end
	    end

	    sa=v1(j);
	    sb=v2(j);
	    sc=v3(j);  

        end
	    %---3
        if (adv>=(pi/3-ah)) & (adv<pi/3)
		ta = mag * ts;
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
    end
    %---------------------------------------------------------------------
	% sector V

	if (x>=-2*pi/3) & (x<-pi/3)

		adv = x+2*pi/3;      ap = adv/(1-6*ah/pi); 
        %--1
        if(adv>=0) & (adv<ah)
		ta = mag * ts;
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
        %--2
        if(adv>=ah) & (adv<(pi/3-ah))
		tb = mag * sin(ap)/cos(pi/6-ap);
		ta = ts-tb;
		t0 = 0;

		t1=[ta/2 tb/2 tb/2 ta/2];
		t1=cumsum(t1);
		v1=[0 1 1 0];
		v2=[0 0 0 0];
		v3=[1 1 1 1];

	    for j=1:4
	        if(y<t1(j))
	            break
	        end
	    end

	    sa=v1(j);
	    sb=v2(j);
	    sc=v3(j); 

        end
        %---3
        if(adv>=(pi/3-ah)) & (adv<pi/3)
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
    end

	%Sector VI

	if (x>=-pi/3) & (x<0)

		adv = x+pi/3;        ap = adv/(1-6*ah/pi); 
        %---1
        if (adv>=0) & (adv<ah)
		
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
        %--2
        if (adv>=ah) & (adv<(pi/3-ah))
		
		ta = mag * sin(ap)/cos(pi/6-ap);
		tb = ts-ta;
		t0 = 0;

		t1=[ta/2 tb/2 tb/2 ta/2];
		t1=cumsum(t1);
		v1=[1 1 1 1];
		v2=[0 0 0 0];
		v3=[0 1 1 0];
	
	    for j=1:4
	        if(y<t1(j))
	            break
	        end
	    end
	    sa=v1(j);
	    sb=v2(j);
	    sc=v3(j);  
        end
        %--3
        if (adv>=(pi/3-ah)) & (adv<pi/3)
		
		ta = mag * ts;
		tb = 0;
		t0 =(ts-ta-tb);

		t1=[ta];
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
    end
	
    sf=[sa, sb, sc];

  
