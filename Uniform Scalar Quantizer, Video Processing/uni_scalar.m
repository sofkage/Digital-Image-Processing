function usq_im = uni_scalar(x,D)
    usq_im = D*sign(x).*floor(abs( abs(x)/D + 1/2));
return 
end
    
    
    