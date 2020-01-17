
%=========================================================================
% Script to calculate the directivity of an antenna using a numericaL  
% method to calculate Prad. 
%
% Help: help Directivity(option H)
%
%==========================================================================


while 1
    
    fprintf('\n=======================================================\n');%menu
    fprintf('A - Calculate Directivity\n');
    fprintf('B - Example 1- Half-wave Dipole\n');
    fprintf('C - Exemplo 2-Array(broadside),2*Half-wave Dipole\n');
    fprintf('H - help Directivity\n');
    fprintf('T - Exit \n');
    fprintf('=======================================================\n');
    
    option = input('>>>', 's');
 
 
    switch option
        
       case {'A', 'a'}  
            
            fprintf('B0'); 
            B0 = input('>>>');
            
            fprintf('M-resolution in phi');
            M = input('>>>');
            
            fprintf('N-resolution in theta');
            N = input('>>>');
            
            fprintf('F(theta,phi)-Ex:@(theta, phi)sin(theta)');
            f = input('>>>','s');
            
        F = str2func(f);% returns handler of f
            

      d=Directivity(B0,M,N,F);
      
            fprintf('\n========Result======================================\n');
            fprintf('d= %.20d\n',d);
            
      d_db=db(d,'power');%Directivity in db
      
            fprintf('d(db)= %.20d',d_db);
           
            
                
       case {'B', 'b'}
            
            %f = '@(theta, phi)sin(theta)' %exampl3 2.5,pag 45 Balanis
            %f = '@(theta, phi)sin(theta)^2' %dipole l<<lambda
            %f = '@(theta, phi)sin(theta)*(sin(phi)^2)'; %example Balanis
            %2,9a %0->pi result * 2
            f = '@(theta, phi)(cos((pi/2)*cos(theta)).^2)./sin(theta).^2';% lambada/2 dipole 
            %f = '@(theta, phi)sin(theta)^3';
            
        F = str2func(f);% % returns handler of f
            
            
   
       d=Directivity(1,360,360,F);
       d_db=db(d,'power');
    
            fprintf('\n========Result======================================\n');
            fprintf('d= %.20d\n',d);
            fprintf('d(db)= %.20d',d_db);
            
   
       case {'C', 'c'}
           
            
            f = '@(theta, phi)(cos((pi/2)*cos(theta)).^2)./sin(theta).^2'; %lambada/2 dipole 
   
            
        F = str2func(f);
   
       format long;
    
            darray=Directivity(1,360,360,F)*1.56^2;% gain (far field)=1.56 so Darray=1.56^2*Dipole
            darray_db=db(darray,'power');
            fprintf('\n========Result======================================\n');
            fprintf('darray= %.20d\n',darray);
            fprintf('darray(db)= %.20d',darray_db);
         
    
     case {'H', 'h'}
           
        help Directivity;
            
     case {'T', 't'}
         
           fprintf('Exiting...\n');
           
           return;
           
     end
            
 end 
    
