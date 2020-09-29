%Simple read and plot output file from the CST

%PARAMETERS

%-----------------------------------------------%

%folder with vna files
filefolder = 'data/'

%filename
filename = "S11_CST_Re_Im_2.5-2.7_optimisation.txt"

%name of plot save filename
pic_name = "images/S11_CST_Re_Im_2.5-2.7_optimisation.png"

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

[frequencies,S11_Re,S11_Im] = CST_filereader(filefolder, filename, N_header, N_size)

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