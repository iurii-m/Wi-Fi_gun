%Simple read and plot output file from the CST

%PARAMETERS

%-----------------------------------------------%

%folder with vna files
filefolder = 'data/'

%filename
filename_1 = "S11_CST_Re_Im_default_parameters.txt"

%filename
filename_2 = "S11_CST_Re_Im_2.3-2.5_optimisation.txt"

%name of plot save filename
pic_name = "images/S11_CST_Re_Im_compare_default_optimised_2.3-2.5.png"

%name of plot title
plot_title = "S-Parameters"

%size of the header
N_header = 3

% size of the data array 
N_size = 1001


%y axis limits
y_min = -20
y_max = 0

%x axis limits
x_min = 0.5
x_max = 6

%---------------------------------------------%
%full save plot path
pic_path = char(strcat(filefolder, pic_name))

[frequencies_1,S11_Re_1,S11_Im_1] = CST_filereader(filefolder, filename_1, N_header, N_size)

[frequencies_2,S11_Re_2,S11_Im_2] = CST_filereader(filefolder, filename_2, N_header, N_size)

S11_Mag_1 = 20 * log10((S11_Re_1.^2 + S11_Im_1.^2).^0.5)

S11_Mag_2 = 20 * log10((S11_Re_2.^2 + S11_Im_2.^2).^0.5)

% Plot smoothed s parameters
figure
plot(frequencies_1, S11_Mag_1, 'b', frequencies_2, S11_Mag_2, 'r-', 'LineWidth', 2)
% Turn on the grid
grid on
% Set the axis limits
axis([x_min x_max y_min y_max])
% Legend
lgd = legend('S11 default','S11 optimised 2.3-2.5')
set(lgd,'Location','best')
% Add title and axis labels
title(plot_title)
xlabel('Frequency, Hz')
ylabel('Magnetude, dB')

saveas(gcf, pic_path)