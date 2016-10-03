function timers=timsim(updown)
	numclks=6048*192*3;
	timers=zeros(numclks,3);
	timers(:,1)=repmat([1:6048]',192*3,1);
	pwmout_one=zeros(numclks,1);
	#if updown is true we go up then down, otherwise we go down then up
	if updown
		pwmout_one(find(timers(:,1)<=5983))=1;
		timers(:,2)=mod(cumsum(pwmout_one),5952);
		pwmout_two=zeros(numclks,1);
		pwmout_two(find(timers(:,2)<=5920))=1;
		timers(:,3)=mod(cumsum(pwmout_two),6048);		
	else
		pwmout_one(find(timers(:,1)<=5921))=1;
		timers(:,2)=mod(cumsum(pwmout_one),5952);
		pwmout_two=zeros(numclks,1);
		pwmout_two(find(timers(:,2)<=5888))=1;
		timers(:,3)=mod(cumsum(pwmout_two),5953);
	endif
endfunction
