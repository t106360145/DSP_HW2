function [out, t]=Hugo_filter(h,x)
        out=zeros(1,length(x)+length(h)-1); %convolution length
        for i = 1:length(out)
            for k= 1:length(h)
                if(i-k>0)
                    if(i-k+1)<=length(x)
                        out(i)=out(i)+h(k)*x(i-k+1);
                    else
                        continue;
                    end
                else
                    break;
                end
            end
        end
    t=1:length(out);
        
    
   