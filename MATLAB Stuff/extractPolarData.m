% This takes an XFLR5 data output and makes the data useable for the user
%
%   @param filename - the filename of the txt file
%   @return data - the data matrix containing all exported data
%   @return mach - the mach number of the simulation
%   @return reynoldsNumber - the reynolds number the simulation was run at
%   @return nCrit - nCrit value
function [ data, mach, reynoldsNumber, nCrit ] = extractPolarData(filename)
% the simulation data is organized in the following columns
% alpha,CL,CD,CDp,Cm,Top Xtr,Bot Xtr,Cpmin,Chinge,XCp   

    file = fopen(filename);
    
    % get the version number of xflr5
    xflr5Version = fgetl(file);
    
    % get blank line 1
    empty1 = fgetl(file);
    assert(isempty(empty1)); % throws error if not empty
    
    % airfoil title
    airfoilName = fgetl(file);
    
    % get blank line 2
    empty2 = fgetl(file);
    assert(isempty(empty2)); % throws error if not empty
    
    % ignore data 1
    fgetl(file);
    
    % get blank line 3 
    empty3 = fgetl(file);
    assert(isempty(empty3)); % throws error if not empty
    
    % ignore data 2
    fgetl(file);
    
    simParameters = fgetl(file);
    params=sscanf(simParameters,' Mach = %f Re = %f e 6 Ncrit = %f');
    mach=params(1);
    reynoldsNumber=params(2)*1e6;
    nCrit=params(3);
    
    % get blank line 4 
    empty4 = fgetl(file);
    assert(isempty(empty4)); % throws error if not empty
    
    % ignore data 3 & 4
    fgetl(file);
    fgetl(file);
    
    % organizes data into a useable table
    tabledata=fscanf(file,'%f');
    ncols=10;
    data=reshape(tabledata',ncols,size(tabledata,1)/ncols)';
    fclose(file);

end

