function [ output ] = detector (img, target, detector_Name)
if strcmp(detector_Name,'CEM')
    disp('Using CEM detector...');
    [ output ] = hyperCem(img',target);
else if strcmp(detector_Name,'AMF')
        disp('Using AMF detector...');
        [ output ] = AMF(img,target);
    else if strcmp(detector_Name,'ACE_w')
            disp('Using ACE whitening detector...');
            [ output ] = ACE_whitening(img,target);
        else if strcmp(detector_Name,'ACE_g')
                disp('Using ACE globalmean detector...');
                [ output ] = ACE_globalmean(img,target);
            end
        end
    end
end
end