%Read CST and VNA data and Compare

%PARAMETERS

%-----------------------------------------------%

%folder with vna files
CST_filefolder = 'data/'
%filename
CST_filename = "S11_CST_Re_Im_default_parameters.txt"
%name of plot title
plot_title = "S-Parameters"
%size of the header
CST_N_header = 3
% size of the data array 
CST_N_size = 1001
%-----------------------------------------------%
%folder with vna files
VNA_filefolder = 'data/'
%filename
VNA_filename = "WIFI_Gun_default__parameters_V2.csv"
%name of plot title
VNA_plot_title = "S-Parameters"
%size of the header
VNA_N_header = 3
% size of the data array 
VNA_N_size = 200

%name of plot save filename
pic_name = "images/Compare_CST_VNA.png"

%y axis limits
y_min = -20
y_max = 0

%x axis limits
x_min = 0.5
x_max = 6

%---------------------------------------------%
%full save plot path
pic_path = char(strcat(CST_filefolder, pic_name))

[CST_frequencies,CST_S11_Re,CST_S11_Im] = CST_filereader(CST_filefolder, CST_filename, CST_N_header, CST_N_size)


[VNA_frequencies,VNA_S11_Re,VNA_S11_Im] = VNA_filereader(VNA_filefolder, VNA_filename, VNA_N_header, VNA_N_size)

CST_S11_Mag = 20 * log10((CST_S11_Re.^2 + CST_S11_Im.^2).^0.5)

VNA_S11_Mag = 20 * log10((VNA_S11_Re.^2 + VNA_S11_Im.^2).^0.5)

% Plot smoothed s parameters
figure
plot(CST_frequencies, CST_S11_Mag, 'b', VNA_frequencies/10^9, VNA_S11_Mag, 'r-', 'LineWidth', 1)
% Turn on the grid
grid on
% Set the axis limits
axis([x_min x_max y_min y_max])
% Legend
lgd = legend('S11 CST','S11 VNA')
set(lgd,'Location','best')
% Add title and axis labels
title(plot_title)
xlabel('Frequency, Hz')
ylabel('Magnetude, dB')


saveas(gcf, pic_path)
