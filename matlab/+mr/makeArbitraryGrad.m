function grad=makeArbitraryGrad(channel,varargin)
%makeArbitraryGrad Create an gradient event with arbitrary waveform.
%   g=makeArbitraryGrad(channel, waveform) Create gradient on
%   the given channel with the specified waveform.
%
%   g=makeArbitraryGrad(...,gradOpts) Ensure the waveforms satisfy the
%   gradient hardware constraints
%
%   See also  Sequence.addBlock

persistent parser
validChannels = {'x','y','z'};
if isempty(parser)
    parser = inputParser;
    parser.FunctionName = 'makeArbitraryGrad';
    parser.addRequired('channel',...
        @(x) any(validatestring(x,validChannels)));
    parser.addRequired('waveform');
    parser.addParamValue('maxGrad',0,@isnumeric);
    parser.addParamValue('maxSlew',0,@isnumeric);
    parser.addOptional('gradOpts',mr.opts(),@isstruct);
end
parse(parser,channel,varargin{:});
opt = parser.Results;

maxSlew=opt.gradOpts.maxSlew;
maxGrad=opt.gradOpts.maxGrad; % TODO: use this when no duration is supplied
if opt.maxGrad>0
    maxGrad=opt.maxGrad;
end
if opt.maxSlew>0
    maxSlew=opt.maxSlew;
end

g=opt.waveform;
slew=(g(2:end)-g(1:end-1))./mr.Sequence.GradRasterTime;
assert(max(abs(slew))<maxSlew,'Slew rate violation (%.0f%%)',max(abs(slew))/maxSlew*100);
assert(max(abs(g))<maxGrad,'Gradient amplitude violation (%.0f%%)',max(abs(g))/maxGrad*100);

grad.type = 'grad';
grad.channel = find(strcmp(opt.channel,validChannels));
grad.waveform = g;
grad.t = (0:length(g)-1)*mr.Sequence.GradRasterTime;

end