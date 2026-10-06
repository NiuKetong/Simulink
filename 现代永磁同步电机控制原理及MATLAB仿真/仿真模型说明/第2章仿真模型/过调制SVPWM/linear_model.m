	% inputs are magnitude u1(:) and angle u2(:);
	% Sector identification
	% n = Total simulation time / step size (integer value)

	function [sf]=linear_model(u)
	 
    ts=0.0002;	
    vdc=1; 
    peak_phase_max = vdc/sqrt(3);
    
	x=u(2);    
    ar = pi/6 ; 
    peak_phase_max1 = vdc/(sqrt(3)*cos(pi/6-ar));
    
   	y = u(3);
	mag = (u(1)/peak_phase_max) * ts;
	
	if (x>=0) & (x<pi/3)
        %--1
        if (x>=0) & (x<ar)
		ta = mag * sin(pi/3-x);
		tb = mag * sin(x);
		t0 =(ts-ta-tb);
		
		t1=[t0/4 ta/2 tb/2 t0/2 tb/2 ta/2 t0/4];
		t1=cumsum(t1);

		v1=[0 1 1 1 1 1 0];
		v2=[0 0 1 1 1 0 0];
		v3=[0 0 0 1 0 0 0];
		
		for j=1:7
			if(y<t1(j))
				break
			end
		end
	
		sa=v1(j);
		sb=v2(j);
		sc=v3(j); 

        end
        %--2
        if (x>=ar) & (x<(pi/3-ar))
            
		tb = mag * sin(x)/cos(pi/3-x);
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
        if (x>=(pi/3-ar)) & (x<pi/3)
		ta = mag * sin(pi/3-x);
		tb = mag * sin(x);
		t0 =(ts-ta-tb);
		
		t1=[t0/4 ta/2 tb/2 t0/2 tb/2 ta/2 t0/4];
		t1=cumsum(t1);

		v1=[0 1 1 1 1 1 0];
		v2=[0 0 1 1 1 0 0];
		v3=[0 0 0 1 0 0 0];
		
		for j=1:7
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

		adv= x-pi/3;
        %--1
        if (adv>=0) & (adv<ar)
		tb = mag * sin(pi/3-adv);
		ta = mag * sin(adv);
		t0 =(ts-ta-tb);

		t1=[t0/4 ta/2 tb/2 t0/2 tb/2 ta/2 t0/4];
		t1=cumsum(t1);

		v1=[0 0 1 1 1 0 0];
		v2=[0 1 1 1 1 1 0];
		v3=[0 0 0 1 0 0 0];

	    for j=1:7
	        if(y<t1(j))
	            break
	        end
	    end

	    sa=v1(j);
	    sb=v2(j);
	    sc=v3(j); 

	    end
        %---2
        if (adv>=ar) & (adv<(pi/3-ar))
            
		ta = mag * sin(adv)/cos(pi/3-adv);
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
        if (adv>=(pi/3-ar)) & (adv<pi/3)
		tb = mag * sin(pi/3-adv);
		ta = mag * sin(adv);
		t0 =(ts-ta-tb);

		t1=[t0/4 ta/2 tb/2 t0/2 tb/2 ta/2 t0/4];
		t1=cumsum(t1);

		v1=[0 0 1 1 1 0 0];
		v2=[0 1 1 1 1 1 0];
		v3=[0 0 0 1 0 0 0];

	    for j=1:7
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

		adv=x-2*pi/3;
        %---1
        if (adv>=0) & (adv<ar)
		ta = mag * sin(pi/3-adv);
		tb = mag * sin(adv);
		t0 =(ts-ta-tb);

		t1=[t0/4 ta/2 tb/2 t0/2 tb/2 ta/2 t0/4];
		t1=cumsum(t1);
		v1=[0 0 0 1 0 0 0];
		v2=[0 1 1 1 1 1 0];
		v3=[0 0 1 1 1 0 0];
	
	    for j=1:7
	        if(y<t1(j))
	            break
	        end
	    end

	    sa=v1(j);
	    sb=v2(j);
	    sc=v3(j); 

        end
        %---2
        if (adv>=ar) & (adv<(pi/3-ar))
		tb = mag * sin(adv)/cos(pi/3-adv);
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
        if (adv>=(pi/3-ar)) & (adv<pi/3)
		ta = mag* sin(pi/3-adv);
		tb = mag * sin(adv);
		t0 =(ts-ta-tb);

		t1=[t0/4 ta/2 tb/2 t0/2 tb/2 ta/2 t0/4];
		t1=cumsum(t1);
		v1=[0 0 0 1 0 0 0];
		v2=[0 1 1 1 1 1 0];
		v3=[0 0 1 1 1 0 0];
	
	    for j=1:7
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

        adv = x + pi; 
        %--1
        if (adv>=0) & (adv<ar)
		tb = mag * sin(pi/3-adv);
		ta = mag * sin(adv);
		t0 =(ts-ta-tb);

		t1=[t0/4 ta/2 tb/2 t0/2 tb/2 ta/2 t0/4];
		t1=cumsum(t1);
	    v1=[0 0 0 1 0 0 0];
	    v2=[0 0 1 1 1 0 0];
	    v3=[0 1 1 1 1 1 0];

	    for j=1:7
	        if(y<t1(j))
	            break
	        end
	    end

	    sa=v1(j);
	    sb=v2(j);
	    sc=v3(j);  

        end
	    %---2
        if (adv>=ar) & (adv<(pi/3-ar))
		ta = mag * sin(adv)/cos(pi/3-adv);
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
        if (adv>=(pi/3-ar)) & (adv<pi/3)
		tb= mag * sin(pi/3 - adv);
		ta = mag * sin(adv);
		t0 =(ts-ta-tb);

		t1=[t0/4 ta/2 tb/2 t0/2 tb/2 ta/2 t0/4];
		t1=cumsum(t1);
	    v1=[0 0 0 1 0 0 0];
	    v2=[0 0 1 1 1 0 0];
	    v3=[0 1 1 1 1 1 0];

	    for j=1:7
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

		adv = x+2*pi/3;
        %--1
        if(adv>=0) & (adv<ar)
		ta = mag * sin(pi/3-adv);
		tb = mag * sin(adv);
		t0 =(ts-ta-tb);

		t1=[t0/4 ta/2 tb/2 t0/2 tb/2 ta/2 t0/4];
		t1=cumsum(t1);
		v1=[0 0 1 1 1 0 0];
		v2=[0 0 0 1 0 0 0];
		v3=[0 1 1 1 1 1 0];

	    for j=1:7
	        if(y<t1(j))
	            break
	        end
	    end

	    sa=v1(j);
	    sb=v2(j);
	    sc=v3(j); 

        end
        %--2
        if(adv>=ar) & (adv<(pi/3-ar))
		tb = mag * sin(adv)/cos(pi/3-adv);
		ta = ts-tb;
		t0 = 0;

		t1=[t0/4 ta/2 tb/2 t0/2 tb/2 ta/2 t0/4];
		t1=cumsum(t1);
		v1=[0 0 1 1 1 0 0];
		v2=[0 0 0 1 0 0 0];
		v3=[0 1 1 1 1 1 0];

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
        if(adv>=(pi/3-ar)) & (adv<pi/3)
		ta = mag * sin(pi/3-adv);
		tb = mag * sin(adv);
		t0 =(ts-ta-tb);

		t1=[t0/4 ta/2 tb/2 t0/2 tb/2 ta/2 t0/4];
		t1=cumsum(t1);
		v1=[0 0 1 1 1 0 0];
		v2=[0 0 0 1 0 0 0];
		v3=[0 1 1 1 1 1 0];

	    for j=1:7
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

		adv = x+pi/3;
        %---1
        if (adv>=0) & (adv<ar)
		
		tb = mag * sin(pi/3-adv);
		ta = mag * sin(adv);
		t0 =(ts-ta-tb);

		t1=[t0/4 ta/2 tb/2 t0/2 tb/2 ta/2 t0/4];
		t1=cumsum(t1);
		v1=[0 1 1 1 1 1 0];
		v2=[0 0 0 1 0 0 0];
		v3=[0 0 1 1 1 0 0];
	
	    for j=1:7
	        if(y<t1(j))
	            break
	        end
	    end
	    sa=v1(j);
	    sb=v2(j);
	    sc=v3(j);  
        end
        %--2
        if (adv>=ar) & (adv<(pi/3-ar))
		
		ta = mag * sin(adv)/cos(pi/3-adv);
		tb = ts-ta;
		t0 = 0;

		t1=[t0/4 ta/2 tb/2 t0/2 tb/2 ta/2 t0/4];
		t1=cumsum(t1);
		v1=[0 1 1 1 1 1 0];
		v2=[0 0 0 1 0 0 0];
		v3=[0 0 1 1 1 0 0];
	
	    for j=1:7
	        if(y<t1(j))
	            break
	        end
	    end
	    sa=v1(j);
	    sb=v2(j);
	    sc=v3(j);  
        end
        %--3
        if (adv>=(pi/3-ar)) & (adv<pi/3)
		
		tb = mag * sin(pi/3-adv);
		ta = mag * sin(adv);
		t0 =(ts-ta-tb);

		t1=[t0/4 ta/2 tb/2 t0/2 tb/2 ta/2 t0/4];
		t1=cumsum(t1);
		v1=[0 1 1 1 1 1 0];
		v2=[0 0 0 1 0 0 0];
		v3=[0 0 1 1 1 0 0];
	
	    for j=1:7
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

  
