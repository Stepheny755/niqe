
bikes_ref = imread(["test_imgs\bikes.bmp"]);
bikes_dis = imread(["test_imgs\bikes_distorted.bmp"]);
parrots_ref = imread(["test_imgs\parrots.bmp"]);
parrots_dis = imread(["test_imgs\parrots_distorted.bmp"]);

%% Base Model

disp("Base Model");
score = niqe(bikes_ref);
fprintf("NIQE score for bikes reference image: %f\n", score);
score = niqe(bikes_dis);
fprintf("NIQE score for bikes distorted image: %f\n", score);
score = niqe(parrots_ref);
fprintf("NIQE score for parrots reference image: %f\n", score);
score = niqe(parrots_dis);
fprintf("NIQE score for parrots distorted image: %f\n", score);

%% Custom Model

disp("Custom Model");
model_params = load("data\niqe_image_params.mat");
model = niqeModel(model_params.pop_mu, model_params.pop_cov, [96 96], 0);

score = niqe(bikes_ref,model);
fprintf("NIQE score for bikes reference image: %f\n", score);
score = niqe(bikes_dis,model);
fprintf("NIQE score for bikes distorted image: %f\n", score);
score = niqe(parrots_ref,model);
fprintf("NIQE score for parrots reference image: %f\n", score);
score = niqe(parrots_dis,model);
fprintf("NIQE score for parrots distorted image: %f\n", score);