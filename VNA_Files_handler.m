%Simple read and plot output file from the VNA

%PARAMETERS

%-----------------------------------------------%

%folder with vna files
filefolder = 'data/'

%filename
filename = "WIFI_Gun_default__parameters_V2.csv"

%name of plot save filename
pic_name = "images/WIFI_Gun_default__parameters_V2.png"

%name of plot title
plot_title = "S-Parameters"

%size of the header
N_header = 3

% size of the data array 
N_size = 200

%y axis limits
y_min = -20
y_max = 0

%x axis limits
x_min = 0.5*10^9 
x_max = 6*10^9

%---------------------------------------------%
%full save plot path
pic_path = char(strcat(filefolder, pic_name))

[frequencies,S11_Re,S11_Im] = VNA_filereader(filefolder, filename, N_header, N_size)

S11_Mag = 20 * log10((S11_Re.^2 + S11_Im.^2).^0.5)

% Plot smoothed s parameters
figure
plot(frequencies, S11_Mag, 'b', 'LineWidth', 2)
% Turn on the grid
grid on
% Set the axis limits
axis([x_min x_max y_min y_max])
% Legend
legend('S11')
% Add title and axis labels
title(plot_title)
xlabel('Frequency, Hz')
ylabel('Magnetude, dB')

saveas(gcf, pic_path)