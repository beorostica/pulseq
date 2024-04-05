% Create trapezoidal gradients:            
sys = mr.opts();            % Default system
seq = mr.Sequence(sys);     % Default sequence

%% Gradient Trapezoidal
% seq.name = 'gr-trapezoidal';          % Name of the sequence
% seq.setDefinition('Name', seq.name) % This is to put the name in the .seq when writing
% gx_amp = seq.sys.gamma * 10e-3;  % 10 mT/m
% gx_dur = 1e-3;                   % 1ms 
% gx = mr.makeTrapezoid('x', 'Amplitude', gx_amp, 'Duration', gx_dur);
% seq.addBlock(gx);
% seq.addBlock(gx);
% seq.addBlock(gx);
% seq.addBlock(gx);
% seq.addBlock(gx);
% seq.addBlock(gx);
% seq.addBlock(gx);
% seq.addBlock(gx);
% seq.addBlock(gx);

%% Gradient Uniformly Shaped
% seq.name = 'gr-uniformly-shaped';   % Name of the sequence
% seq.setDefinition('Name', seq.name) % This is to put the name in the .seq when writing
% N = 10;
% gx_wave = cos(2*pi*(0:1/(N-1):1)) * sys.gamma * 1e-3; % 10 mT/m
% gx = mr.makeArbitraryGrad('x', gx_wave);
% seq.addBlock(gx);
% seq.addBlock(gx);
% seq.addBlock(gx);

%% Gradient Time Shaped
% seq.name = 'gr-time-shaped';   % Name of the sequence
% seq.setDefinition('Name', seq.name) % This is to put the name in the .seq when writing
% N = 10;
% gx_wave = cos(2*pi*(0:1/(N-1):1)) * sys.gamma * 1e-3; % 10 mT/m
% tx_wave = [0 0.5 1 2 3.5 4 5 6.5 8 9] * 2 * sys.gradRasterTime; 
% gx = mr.makeExtendedTrapezoid('x', 'times', tx_wave, 'amplitudes', gx_wave);
% seq.addBlock(gx);
% seq.addBlock(gx);
% seq.addBlock(gx);

%% RF Pulse
% seq.name = 'rf-pulse';              % Name of the sequence
% seq.setDefinition('Name', seq.name) % This is to put the name in the .seq when writing
% rf_flip = pi/2;
% rf_dur = 10e-3;
% rf = mr.makeBlockPulse(rf_flip, 'Duration', rf_dur);
% seq.addBlock(rf);
% seq.addBlock(rf);
% seq.addBlock(rf);

%% RF Uniformly Shaped
% seq.name = 'rf-uniformly-shaped';   % Name of the sequence
% seq.setDefinition('Name', seq.name) % This is to put the name in the .seq when writing
% rf_flip = pi/2;
% rf_dur = 10e-6;
% rf = mr.makeSincPulse(rf_flip, 'Duration', rf_dur);
% seq.addBlock(rf);
% seq.addBlock(rf);
% seq.addBlock(rf);

%% RF Time-Shaped
% seq.name = 'rf-time-shaped';   % Name of the sequence
% seq.setDefinition('Name', seq.name) % This is to put the name in the .seq when writing
% 
% rf = mr.makeBlockPulse(pi/2, 'Duration', 0.1e-3, 'system', sys);
% %Nx = 8;
% %adc = mr.makeAdc(Nx, 'Duration', 3.2e-3, 'system', sys,'delay', system.adcDeadTime);
% %delayTE = 20e-3;
% %delayTR = 1000e-3;
% 
% % Loop over repetitions and define sequence blocks
% for i=1:3
%     seq.addBlock(rf);
%     %seq.addBlock(mr.makeDelay(delayTE));
%     %seq.addBlock(adc,mr.makeDelay(mr.calcDuration(adc)));
%     %seq.addBlock(mr.makeDelay(delayTR))
% end

% seq.write(strcat(seq.name, '.seq'))     % This writes a .seq file
% seq.read(strcat(seq.name, '.seq'))
% seq.plot()                              % This writes a .mat file

%% Just read a .seq and write the .mat
seq.read('cine_gre.seq'); seq.plot()
seq.read('DEMO_gre0.seq'); seq.plot()
seq.read('DEMO_grep0.seq'); seq.plot()
seq.read('epi.seq'); seq.plot()
seq.read('epi_label.seq'); seq.plot()
seq.read('epi_rs.seq'); seq.plot()
seq.read('epi_rs_label.seq'); seq.plot()
seq.read('epi_se.seq'); seq.plot()
seq.read('epidiff_rs.seq'); seq.plot()
seq.read('epise_rs.seq'); seq.plot()
seq.read('fid.seq'); seq.plot()
seq.read('gre.seq'); seq.plot()
seq.read('gre3d.seq'); seq.plot()
seq.read('gre_gt.seq'); seq.plot()
seq.read('gre_lbl.seq'); seq.plot()
seq.read('gre_rad.seq'); seq.plot()
seq.read('gr-time-shaped.seq'); seq.plot()
seq.read('gr-trapezoidal.seq'); seq.plot()
seq.read('gr-uniformly-shaped.seq'); seq.plot()
seq.read('haste.seq'); seq.plot()
seq.read('MSE_test_KomaMRI.seq'); seq.plot()
seq.read('press.seq'); seq.plot()
seq.read('rf-pulse.seq'); seq.plot()
seq.read('rf-time-shaped.seq'); seq.plot()
seq.read('rf-uniformly-shaped.seq'); seq.plot()
seq.read('selectiveRf.seq'); seq.plot()
seq.read('spiral.seq'); seq.plot()
seq.read('trufi.seq'); seq.plot()
seq.read('tse.seq'); seq.plot()
seq.read('ute.seq'); seq.plot()
seq.read('ute_rs.seq'); seq.plot()
seq.read('zte_petra.seq'); seq.plot()
