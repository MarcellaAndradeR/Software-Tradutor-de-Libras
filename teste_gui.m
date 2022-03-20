function varargout = teste_gui(varargin)
% TESTE_GUI MATLAB code for teste_gui.fig
%      TESTE_GUI, by itself, creates a new TESTE_GUI or raises the existing
%      singleton*.
%
%      H = TESTE_GUI returns the handle to a new TESTE_GUI or the handle to
%      the existing singleton*.
%
%      TESTE_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TESTE_GUI.M with the given input arguments.
%
%      TESTE_GUI('Property','Value',...) creates a new TESTE_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before teste_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to teste_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help teste_gui

% Last Modified by GUIDE v2.5 08-Sep-2014 10:44:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @teste_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @teste_gui_OutputFcn, ...
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


% --- Executes just before teste_gui is made visible.
function teste_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to teste_gui (see VARARGIN)

% Choose default command line output for teste_gui

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes teste_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%Inserir Logo do IESB
axes(handles.axes3);
imshow('iesb.png');





% --- Outputs from this function are returned to the command line.
function varargout = teste_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function sw_libras_Callback(hObject, eventdata, handles)
% hObject    handle to sw_libras (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sw_libras as text
%        str2double(get(hObject,'String')) returns contents of sw_libras as a double


% --- Executes during object creation, after setting all properties.
function sw_libras_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sw_libras (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in liga_webcam.
function liga_webcam_Callback(hObject, eventdata, handles)
axes(handles.axes1);
% Iniciando a Webcam.

global CAM
try
    hold off;
            axis auto;
            axis on;
            % Ampliar Figura para tela cheia.
            set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
 
VidObj= videoinput('winvideo', 1, 'YUY2_640x480');
VidObj.ReturnedColorspace = 'rgb';
handles.VidObj=VidObj;CAM=1;
vidRes = get(handles.VidObj, 'VideoResolution');
nBands = get(handles.VidObj, 'NumberOfBands');
set(handles.axes1)
hImage = image( zeros(vidRes(1), vidRes(2), nBands) );
preview(handles.VidObj, hImage)
catch E
    msgbox({'Configure a Webcam corretamente!',' ',E.message},'CAM INFO')
end
guidata(hObject, handles);

           
            hold on
            %Cria quadrado vermelho en tempo real
            thisBB = [28.5 27.5 311 381]
            rectangle('Position', [thisBB(1),thisBB(2),thisBB(3),thisBB(4)], 'EdgeColor','r','LineWidth',2 )
           





% --- Executes on button press in reconhecer_caracter.
function reconhecer_caracter_Callback(hObject, eventdata, handles)

%Comparar Imagem com banco de dados da rede neural
I=imread('Imagemfinal.jpg');
%Cortar a imagem em resolução 50x50
I2 = imcrop(I,[290 184 618 618]);
I3 = imresize(I2, [50 50]);

G11 = rgb2gray(I3);
BW11=im2bw(G11);
A11=im2double(BW11);

Z=[A11(:)];

v = evalin ('base', 'net'); 
C = sim(v,Z)

%Matrizes de saida da rede neural reconhecida

if C(1,1)>0.85 & C(2,1)<0.09 & C(3,1)<0.09 & C(4,1)<0.09 
    axes(handles.axes2);
    imshow('letraA.jpg');
end
if C(1,1)<0.09 & C(2,1)>0.85 & C(3,1)<0.09 & C(4,1)<0.09 
    axes(handles.axes2);
    imshow('letraB.jpg');
end
if C(1,1)<0.09 & C(2,1)<0.09 & C(3,1)>0.85 & C(4,1)<0.09 
    axes(handles.axes2);
    imshow('letraC.jpg');
end
if C(1,1)<0.09 & C(2,1)<0.09 & C(3,1)<0.09 & C(4,1)>0.85 
    axes(handles.axes2);
    imshow('letraD.jpg');
else
    axes(handles.axes2);
    imshow('SemLetra.jpg');
end

        



% --- Executes on button press in captura_imagem.
function captura_imagem_Callback(hObject, eventdata, handles)

global S CAM;
if(CAM==1)
    CAM=0;
    S=getsnapshot(handles.VidObj);
         
            vid.ReturnedColorspace = 'rgb';
            
    closepreview
%     clear VidObj
%     delete  VidObj
     imshow(S);
else
   msgbox('Por favor! Clique no Botão Liga Webcam primeiro') 
end

            
          
            imshow(S,'parent',handles.axes1);
            title ('Delimitando com quadrado');
            hold on
           

            hold off;
            axis auto;
            axis on;
            % Ampliar Figura para tela cheia.
            set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
            thisBB=[28.5 27.5 311 381]
            rectangle('Position', [thisBB(1),thisBB(2),thisBB(3),thisBB(4)], 'EdgeColor','r','LineWidth',2 )
            hold on;
            
             figure('Toolbar','none',...
            'Menubar', 'none',...
            'NumberTitle','Off',...
            'Name','Imagem capturada');
            croppedImage = imcrop(S, thisBB);
            imshow(croppedImage)
            title('Imagem Cortada', 'FontSize', 20); 
            
            % Salvar a Imagem no Desktop
            saveas(gcf,'Imagemfinal.jpg');
            pause(3);
                   



            

            
          


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
