function varargout = project(varargin)
%PROJECT MATLAB code file for project.fig
%      PROJECT, by itself, creates a new PROJECT or raises the existing
%      singleton*.
%
%      H = PROJECT returns the handle to a new PROJECT or the handle to
%      the existing singleton*.
%
%      PROJECT('Property','Value',...) creates a new PROJECT using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to project_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      PROJECT('CALLBACK') and PROJECT('CALLBACK',hObject,...) call the
%      local function named CALLBACK in PROJECT.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help project

% Last Modified by GUIDE v2.5 23-May-2023 02:04:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @project_OpeningFcn, ...
                   'gui_OutputFcn',  @project_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
   gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before project is made visible.
function project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes project wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = project_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
RGB = uigetfile();
RGB = imread(RGB);
axes(handles.axes1);
imshow(RGB);
setappdata(0,'RGB',RGB);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
RGB = getappdata(0,'RGB');
K = to_gray(RGB);
axes(handles.axes2);
imshow(K);
setappdata(0 , 'filename' , K);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fact2 = get(handles.fact2 , 'string');
fact2 = str2num(fact2);
%  set(handles.fact2 , 'string' , fact2);
RGB = getappdata(0,'RGB');
dm_img = DM_1order(RGB , fact2);
axes(handles.axes2);
imshow(dm_img);
setappdata(0 , 'filename' , dm_img);

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


D5  = get(handles.D5 , 'string');
D5 = str2num(D5);


%  set(handles.fact2 , 'string' , fact2);
RGB = getappdata(0,'RGB');
 Gaussian_Low_im = Gaussian_LPF(RGB , D5);
axes(handles.axes2);
imshow(Gaussian_Low_im);
setappdata(0 , 'filename' , Gaussian_Low_im);

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


D6  = get(handles.D6 , 'string');
D6 = str2num(D6);

%  set(handles.fact2 , 'string' , fact2);
RGB = getappdata(0,'RGB');
 Gaussian_high_im = Gaussian_HPF(RGB , D6);
axes(handles.axes2);
imshow(Gaussian_high_im);
setappdata(0 , 'filename' , Gaussian_high_im);

% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
D4  = get(handles.D4 , 'string');
D4 = str2num(D4);

n2  = get(handles.n2 , 'string');
n2 = str2num(n2);
%  set(handles.fact2 , 'string' , fact2);
RGB = getappdata(0,'RGB');
 Butterworth_h_im = Butterworth_HPF(RGB , D4 , n2);
axes(handles.axes2);
imshow(Butterworth_h_im);
setappdata(0 , 'filename' , Butterworth_h_im);

% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



D3  = get(handles.D3 , 'string');
D3 = str2num(D3);

n1  = get(handles.n1 , 'string');
n1 = str2num(n1);
%  set(handles.fact2 , 'string' , fact2);
RGB = getappdata(0,'RGB');
 Butterworth_im = Butterworth_LPF(RGB , D3 , n1);
axes(handles.axes2);
imshow(Butterworth_im);
setappdata(0 , 'filename' , Butterworth_im);

% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


D2  = get(handles.D2 , 'string');
D2 = str2num(D2);
%  set(handles.fact2 , 'string' , fact2);
RGB = getappdata(0,'RGB');
hlp_im = Ideal_HPF(RGB , D2);
axes(handles.axes2);
imshow(hlp_im);
setappdata(0 , 'filename' , hlp_im);


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

D1  = get(handles.D1 , 'string');
D1 = str2num(D1);
RGB = getappdata(0,'RGB');
ilp_im = Ideal_LPF(RGB , D1);
axes(handles.axes2);
imshow(ilp_im);
setappdata(0 , 'filename' , ilp_im);

% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
RGB = getappdata(0,'RGB');
edgedetc_im = Edgedetection_filter(RGB);
axes(handles.axes2);
imshow(edgedetc_im);
setappdata(0 , 'filename' , edgedetc_im);

% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


filtersize2  = get(handles.filtersize2 , 'string');
filtersize2 = str2num(filtersize2);
RGB = getappdata(0,'RGB');
unsharp_im = Unsharpe_Masking(RGB , filtersize2);
axes(handles.axes2);
imshow(unsharp_im);
setappdata(0 , 'filename' , unsharp_im);

% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

RGB = getappdata(0,'RGB');
avg_im = Average(RGB);
axes(handles.axes2);
imshow(avg_im);
setappdata(0 , 'filename' , avg_im);

% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


k  = get(handles.k , 'string');
k = str2num(k);
RGB = getappdata(0,'RGB');
quan_im = quantization(RGB , k);
axes(handles.axes2);
imshow(quan_im);
setappdata(0 , 'filename' , quan_im);


% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

RGB = getappdata(0,'RGB');
sharp_im = sharpening(RGB);
axes(handles.axes2);
imshow(sharp_im);
setappdata(0 , 'filename' , sharp_im);


% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

sigma1  = get(handles.sigma1 , 'string');
sigma1 = str2num(sigma1);
RGB = getappdata(0,'RGB');
weighted_im = Weighted_Filter(RGB , sigma1);
axes(handles.axes2);
imshow(weighted_im);
setappdata(0 , 'filename' , weighted_im);


% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

RGB = getappdata(0,'RGB');
im_negative = negative(RGB);
axes(handles.axes2);
imshow(im_negative);
setappdata(0 , 'filename' , im_negative);



% --- Executes on button press in pushbutton27.
function pushbutton27_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

RGB = getappdata(0,'RGB');
histo_match_im = Histogram_Matching(RGB , RGB);
axes(handles.axes2);
histogram(histo_match_im);
setappdata(0 , 'filename' , histo_match_im);



% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

RGB = getappdata(0,'RGB');
RGB2 = getappdata(0,'filename');
sub_im = Subtract(RGB , RGB2);
axes(handles.axes2);
imshow(sub_im);
setappdata(0 , 'filename' , sub_im);



% --- Executes on button press in pushbutton29.
function pushbutton29_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


RGB = getappdata(0,'RGB');
RGB2 = getappdata(0,'filename');
add_im = Add(RGB , RGB2);
axes(handles.axes2);
imshow(add_im);
setappdata(0 , 'filename' , add_im);



% --- Executes on button press in pushbutton30.
function pushbutton30_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
RGB = getappdata(0,'RGB');
histo_eq_im = Histogram_Equalization(RGB);
axes(handles.axes2);
%set(gcf, 'Visible', 'off');
histogram(histo_eq_im);
setappdata(0 , 'filename' , histo_eq_im);

% --- Executes on button press in pushbutton31.
function pushbutton31_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


gamma1 = get(handles.gamma1 , 'string');
gamma1 = str2num(gamma1);
RGB = getappdata(0,'RGB');
power_im = power_law(RGB , gamma1);
axes(handles.axes2);
imshow(power_im);
setappdata(0 , 'filename' , power_im);


% --- Executes on button press in pushbutton32.
function pushbutton32_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


offset1 = get(handles.offset1 , 'string');
offset1 = str2num(offset1);
RGB = getappdata(0,'RGB');
brightness_im = brightness(RGB , offset1);
axes(handles.axes2);
imshow(brightness_im);
setappdata(0 , 'filename' , brightness_im);




% --- Executes on button press in pushbutton33.
function pushbutton33_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

max1 = get(handles.max1 , 'string');
max1 = str2num(max1);

min1 = get(handles.min1 , 'string');
min1 = str2num(min1);
RGB = getappdata(0,'RGB');
const_adj = contrast_adj(RGB, min1, max1);
axes(handles.axes2);
imshow(const_adj);
setappdata(0 , 'filename' , const_adj);


% --- Executes on button press in pushbutton34.
function pushbutton34_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

RGB = getappdata(0,'RGB');
histo_im = Draw_Histogram(RGB);
axes(handles.axes2);
%set(gcf, 'Visible', 'off');
histogram(histo_im);
setappdata(0 , 'filename' , histo_im);

function fact2_Callback(hObject, eventdata, handles)
% hObject    handle to fact2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fact2 as text
%        str2double(get(hObject,'String')) returns contents of fact2 as a double


% --- Executes during object creation, after setting all properties.
function fact2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fact2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to max1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max1 as text
%        str2double(get(hObject,'String')) returns contents of max1 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function max1_Callback(hObject, eventdata, handles)
% hObject    handle to max1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max1 as text
%        str2double(get(hObject,'String')) returns contents of max1 as a double


% --- Executes during object creation, after setting all properties.
function max1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function offset1_Callback(hObject, eventdata, handles)
% hObject    handle to offset1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of offset1 as text
%        str2double(get(hObject,'String')) returns contents of offset1 as a double


% --- Executes during object creation, after setting all properties.
function offset1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to offset1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function min1_Callback(hObject, eventdata, handles)
% hObject    handle to min1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of min1 as text
%        str2double(get(hObject,'String')) returns contents of min1 as a double


% --- Executes during object creation, after setting all properties.
function min1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to min1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function gamma1_Callback(hObject, eventdata, handles)
% hObject    handle to gamma1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gamma1 as text
%        str2double(get(hObject,'String')) returns contents of gamma1 as a double


% --- Executes during object creation, after setting all properties.
function gamma1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gamma1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton35.
function pushbutton35_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

RGB2 = uigetfile();
RGB2 = imread(RGB2);
axes(handles.axes1);
imshow(RGB2);
setappdata(0,'filename',RGB2);



% --- Executes on button press in pushbutton37.
function pushbutton37_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

RGB2 = uigetfile();
RGB2 = imread(RGB2);
axes(handles.axes1);
imshow(RGB2);
setappdata(0,'filename',RGB2);


% --- Executes on button press in pushbutton38.
function pushbutton38_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
RGB2 = uigetfile();
RGB2 = imread(RGB2);
axes(handles.axes1);
imshow(RGB2);
setappdata(0,'filename',RGB2);



function k_Callback(hObject, eventdata, handles)
% hObject    handle to k (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of k as text
%        str2double(get(hObject,'String')) returns contents of k as a double


% --- Executes during object creation, after setting all properties.
function k_CreateFcn(hObject, eventdata, handles)
% hObject    handle to k (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sigma1_Callback(hObject, eventdata, handles)
% hObject    handle to sigma1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sigma1 as text
%        str2double(get(hObject,'String')) returns contents of sigma1 as a double


% --- Executes during object creation, after setting all properties.
function sigma1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sigma1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function filtersize1_Callback(hObject, eventdata, handles)
% hObject    handle to filtersize1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of filtersize1 as text
%        str2double(get(hObject,'String')) returns contents of filtersize1 as a double


% --- Executes during object creation, after setting all properties.
function filtersize1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filtersize1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function filtersize2_Callback(hObject, eventdata, handles)
% hObject    handle to filtersize2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of filtersize2 as text
%        str2double(get(hObject,'String')) returns contents of filtersize2 as a double


% --- Executes during object creation, after setting all properties.
function filtersize2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filtersize2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function pushbutton21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function D1_Callback(hObject, eventdata, handles)
% hObject    handle to D1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of D1 as text
%        str2double(get(hObject,'String')) returns contents of D1 as a double


% --- Executes during object creation, after setting all properties.
function D1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to D1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function D2_Callback(hObject, eventdata, handles)
% hObject    handle to D2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of D2 as text
%        str2double(get(hObject,'String')) returns contents of D2 as a double


% --- Executes during object creation, after setting all properties.
function D2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to D2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function D3_Callback(hObject, eventdata, handles)
% hObject    handle to D3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of D3 as text
%        str2double(get(hObject,'String')) returns contents of D3 as a double


% --- Executes during object creation, after setting all properties.
function D3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to D3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function n1_Callback(hObject, eventdata, handles)
% hObject    handle to n1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n1 as text
%        str2double(get(hObject,'String')) returns contents of n1 as a double


% --- Executes during object creation, after setting all properties.
function n1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function D4_Callback(hObject, eventdata, handles)
% hObject    handle to D4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of D4 as text
%        str2double(get(hObject,'String')) returns contents of D4 as a double


% --- Executes during object creation, after setting all properties.
function D4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to D4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function n2_Callback(hObject, eventdata, handles)
% hObject    handle to n2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n2 as text
%        str2double(get(hObject,'String')) returns contents of n2 as a double


% --- Executes during object creation, after setting all properties.
function n2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function D5_Callback(hObject, eventdata, handles)
% hObject    handle to D5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of D5 as text
%        str2double(get(hObject,'String')) returns contents of D5 as a double


% --- Executes during object creation, after setting all properties.
function D5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to D5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function n3_Callback(hObject, eventdata, handles)
% hObject    handle to n3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n3 as text
%        str2double(get(hObject,'String')) returns contents of n3 as a double


% --- Executes during object creation, after setting all properties.
function n3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function n4_Callback(hObject, eventdata, handles)
% hObject    handle to n4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n4 as text
%        str2double(get(hObject,'String')) returns contents of n4 as a double


% --- Executes during object creation, after setting all properties.
function n4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function D6_Callback(hObject, eventdata, handles)
% hObject    handle to D6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of D6 as text
%        str2double(get(hObject,'String')) returns contents of D6 as a double


% --- Executes during object creation, after setting all properties.
function D6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to D6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pushbutton33_CreateFcn(hObject, eventdata, handles)
% hObject    handle to D6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton39.
function pushbutton39_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fact1 = get(handles.fact1 , 'string');
fact1 = str2num(fact1);
%  set(handles.fact2 , 'string' , fact2);
RGB = getappdata(0,'RGB');
dm_img = DM_0L(RGB , fact1);
axes(handles.axes2);
imshow(dm_img);
setappdata(0 , 'filename' , dm_img);


% --- Executes on button press in pushbutton40.
function pushbutton40_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fact_r = get(handles.fact_r , 'string');
fact_r = str2num(fact_r);
fact_c = get(handles.fact_c , 'string');
fact_c = str2num(fact_c);
%  set(handles.fact2 , 'string' , fact2);
RGB = getappdata(0,'RGB');
dm_img = RM_0_order(RGB,fact_r, fact_c);
axes(handles.axes2);
imshow(dm_img);
setappdata(0 , 'filename' , dm_img);

% --- Executes on button press in pushbutton41.
function pushbutton41_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

fact_r1 = get(handles.fact_r1, 'string');
fact_r1 = str2num(fact_r1);
fact_c1 = get(handles.fact_c1 , 'string');
fact_c1 = str2num(fact_c1);
RGB = getappdata(0,'RGB');
dm_img = RM_1_order(RGB, fact_r1, fact_c1);
axes(handles.axes2);
imshow(dm_img);
setappdata(0 , 'filename' , dm_img);


function fact_r_Callback(hObject, eventdata, handles)
% hObject    handle to fact_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fact_r as text
%        str2double(get(hObject,'String')) returns contents of fact_r as a double


% --- Executes during object creation, after setting all properties.
function fact_r_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fact_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fact_c_Callback(hObject, eventdata, handles)
% hObject    handle to fact_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fact_c as text
%        str2double(get(hObject,'String')) returns contents of fact_c as a double


% --- Executes during object creation, after setting all properties.
function fact_c_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fact_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton42.
function pushbutton42_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

mask = get(handles.mask , 'string');
mask = str2num(mask);
RGB = getappdata(0,'RGB');
new_im = Max_Filter(RGB, mask);
axes(handles.axes2);
imshow(new_im);
setappdata(0 , 'filename' , new_im);



function mask2_Callback(hObject, eventdata, handles)
% hObject    handle to mask2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mask2 as text
%        str2double(get(hObject,'String')) returns contents of mask2 as a double


% --- Executes during object creation, after setting all properties.
function mask2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mask2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton43.
function pushbutton43_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mask2 = get(handles.mask2 , 'string');
mask2 = str2num(mask2);
RGB = getappdata(0,'RGB');
new_im = Median_Filter(RGB, mask2);
axes(handles.axes2);
imshow(new_im);
setappdata(0 , 'filename' , new_im);


% --- Executes on button press in pushbutton44.
function pushbutton44_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

mask3 = get(handles.mask3 , 'string');
mask3 = str2num(mask3);
RGB = getappdata(0,'RGB');
new_im = Min_Filter(RGB, mask3);
axes(handles.axes2);
imshow(new_im);
setappdata(0 , 'filename' , new_im);


function mask3_Callback(hObject, eventdata, handles)
% hObject    handle to mask3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mask3 as text
%        str2double(get(hObject,'String')) returns contents of mask3 as a double


% --- Executes during object creation, after setting all properties.
function mask3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mask3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mask_Callback(hObject, eventdata, handles)
% hObject    handle to mask (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mask as text
%        str2double(get(hObject,'String')) returns contents of mask as a double


% --- Executes during object creation, after setting all properties.
function mask_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mask (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fact_r1_Callback(hObject, eventdata, handles)
% hObject    handle to fact_r1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fact_r1 as text
%        str2double(get(hObject,'String')) returns contents of fact_r1 as a double


% --- Executes during object creation, after setting all properties.
function fact_r1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fact_r1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fact_c1_Callback(hObject, eventdata, handles)
% hObject    handle to fact_c1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fact_c1 as text
%        str2double(get(hObject,'String')) returns contents of fact_c1 as a double


% --- Executes during object creation, after setting all properties.
function fact_c1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fact_c1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fact1_Callback(hObject, eventdata, handles)
% hObject    handle to fact1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fact1 as text
%        str2double(get(hObject,'String')) returns contents of fact1 as a double


% --- Executes during object creation, after setting all properties.
function fact1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fact1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton46.
function pushbutton46_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
RGB = getappdata(0,'RGB');
new_img = salt_and_pepper(RGB);
axes(handles.axes2);
imshow(new_img);
setappdata(0 , 'filename' , new_img);


% --- Executes on button press in pushbutton47.
function pushbutton47_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
offset_d = get(handles.offset_d, 'string');
offset_d = str2num(offset_d);
RGB = getappdata(0,'RGB');
new_img = DarkBright(RGB,offset_d);
axes(handles.axes2);
imshow(new_img);
setappdata(0 , 'filename' , new_img);



function offset_d_Callback(hObject, eventdata, handles)
% hObject    handle to offset_d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of offset_d as text
%        str2double(get(hObject,'String')) returns contents of offset_d as a double


% --- Executes during object creation, after setting all properties.
function offset_d_CreateFcn(hObject, eventdata, handles)
% hObject    handle to offset_d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
