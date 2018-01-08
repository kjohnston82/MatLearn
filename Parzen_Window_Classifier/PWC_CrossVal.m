% Copyright (c) 2005, Kyle Johnston
% All rights reserved.
% 
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are met:
% 
% 1. Redistributions of source code must retain the above copyright notice, this
%    list of conditions and the following disclaimer.
% 2. Redistributions in binary form must reproduce the above copyright notice,
%    this list of conditions and the following disclaimer in the documentation
%    and/or other materials provided with the distribution.
% 
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
% ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
% WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
% DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
% ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
% (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
% LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
% ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
% (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
% SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
% 
% The views and conclusions contained in the software and documentation are those
% of the authors and should not be interpreted as representing official policies,
% either expressed or implied, of the FreeBSD Project.
function [classEstimate] = PWC_CrossVal(fltPatternArray_CrossVal, grpSource_CrossVal, spread)

    %% Testing
    maxSizeA1  = max(fltPatternArray_CrossVal);
    minSizeA1  = min(fltPatternArray_CrossVal);
    [X,Y] = meshgrid(linspace(minSizeA1(1),maxSizeA1(1), 100),linspace(minSizeA1(2),maxSizeA1(2), 100));
    X = X(:); Y = Y(:);
    fltTesting = cat(2, X, Y);

    [~, classEstimate] = Parzen_Window_Classifier(...
        fltPatternArray_CrossVal, grpSource_CrossVal, fltTesting, ...
        3, spread, 'Missed');
    
    
    figure
    gscatter(fltTesting(:,1), fltTesting(:,2), classEstimate', 'br','.', 2);
    hold on
    gscatter(fltPatternArray_CrossVal(:,1), fltPatternArray_CrossVal(:,2), grpSource_CrossVal, 'br','xo', 6)
    hold off

end