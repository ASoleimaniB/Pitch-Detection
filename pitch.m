function varargout = pitch(varargin)
% PITCH MATLAB code for pitch.fig
%      PITCH, by itself, creates a new PITCH or raises the existing
%      singleton*.
%
%      H = PITCH returns the handle to a new PITCH or the handle to
%      the existing singleton*.
%
%      PITCH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PITCH.M with the given input arguments.
%
%      PITCH('Property','Value',...) creates a new PITCH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before pitch_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to pitch_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help pitch

% Last Modified by GUIDE v2.5 04-Aug-2012 18:57:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @pitch_OpeningFcn, ...
                   'gui_OutputFcn',  @pitch_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
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


% --- Executes just before pitch is made visible.
function pitch_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to pitch (see VARARGIN)
load('pnames.mat')

bar(handles.axes2,pitchfreq(1,:),pitchfreq(2,:),'BarWidth',0.6)
axes(handles.axes2)
 axis tight 
 set (gca,'YTick',[])
 set(gca,'XTick',[0:500:4000])
 xlim([0,2000])
% Choose default command line output for pitch
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes pitch wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = pitch_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

button_state = get(hObject, 'value');
if button_state == get(hObject, 'max')

    set(hObject,'BackgroundColor','red')

    while button_state == get(hObject, 'max')        
    
    [F,c]=startpitch;

    plot(handles.axes1,F);    


         if c<inf
         axes(handles.axes3) 
         load('pnames.mat')
         val=c;
         set(handles.edit,'string',val)
         bar(handles.axes3,pitchfreq(1,:),pitchfreq(2,:),'BarWidth',0.6)
         axis tight
         set(gca,'YTick',[])
         set(gca,'XTick',pitchfreq(1,:))
         hold on handles.axes3;
         stem(handles.axes3,[val],[1],'Marker','none','LineWidth',3,'Color','red')
         xlim([.8*val,1.2*val])
         set(gca,'XTickLabel',pitchnames)
         hold off handles.axes3;
         axes(handles.axes2) 
         cla(handles.axes2)
         hold on handles.axes2;
         bar(handles.axes2,pitchfreq(1,:),pitchfreq(2,:),'BarWidth',0.5)
         stem(handles.axes2,[val],[1],'Marker','none','LineWidth',3,'Color','red')
         xlim([150,2000])
         hold off handles.axes2;
         end

    button_state = get(hObject, 'value');
    end
  
    elseif button_state == get(hObject, 'min')
    set(hObject,'BackgroundColor','Green')
    
end

% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% if ss==1;
%     plot(F)
% end
% Hint: place code in OpeningFcn to populate axes1


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes3



function edit_Callback(hObject, eventdata, handles)
% hObject    handle to edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit as text
%        str2double(get(hObject,'String')) returns contents of edit as a double


% --- Executes during object creation, after setting all properties.
function edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
