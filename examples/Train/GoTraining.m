function [net, info] = GoTraining(imdb,varargin)
% clear all;clc;

opts.train.batchSize = 1;
opts.train.numEpochs = 2000;

opts.train.continue = true ;
opts = vl_argparse(opts, varargin) ;

net = cnn_joint_init(opts) ;

[net, info] = cnn_joint_train(net, imdb, @getBatch, opts.train, 'val', find(imdb.images.set == 3)) ;

function [im, labels] = getBatch(imdb, batch)
% --------------------------------------------------------------------
im = imdb.images.data(:,:,:,batch) ;
labels = imdb.images.labels(:,:,:,batch) ;
% if learning the residual only
% labels = labels - im(7:33-6,7:33-6,1,:);
