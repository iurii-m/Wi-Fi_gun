%CST file reader
function [frequencies,S11_Re,S11_Im] = CST_filereader(filefolder, filename,N_header, N_size)

%full read file path
filepath = char(strcat(filefolder, filename))

%empty data arrays
frequencies = 1: 1.0 : N_size; 
S11_Re = 1: 1.0 : N_size; 
S11_Im = 1: 1.0 : N_size; 

%read file
fid = fopen(filepath);
%skip header
for c = 1:N_header
    tline = fgetl(fid);
end
%read first array 
for c = 1:N_size
    %disp(tline)
    tline = fgetl(fid);
    disp(tline)
    newStr = split(tline)
    %disp(frequencies(c))
    frequencies(c) = str2double(newStr(1))
    S11_Re(c) = str2double(newStr(2))
    S11_Im(c) = str2double(newStr(3))
    %disp(newStr(2))
end

fclose(fid);