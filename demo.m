close all;clear;clc
%% parameters
K = 20;%number of selected bands
detector_Name = 'CEM';
method_Name = 'CDSP_MaxV'; % CDSP_MinV; CDSP_MaxV
disp(['number of selected bands: ',num2str(K)]);

%% load data
load hydice_urban_162.mat;
img_src = data;
img_gt = map;

%% pre-processing
[W, H, L]=size(img_src);
img_src = normalize(img_src);
img = reshape(img_src, W * H, L);
target = get_target(img,img_gt)';

%% BS
band_Set = CDSPBS(img,target,method_Name,K);

%% evaluation
[ out ] = detector(img(:,band_Set),target(band_Set),detector_Name);
detectmap = reshape(out,W,H);
figure,imagesc(detectmap);
[auc] = auc(detectmap,img_gt);
