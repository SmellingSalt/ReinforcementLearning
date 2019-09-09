%%%%%%%%%%%%%%%%%%%%%Created by SAWAN SINGH MAHARA%%%%%%%%%%%%%%%%%%%%%%%%%

classdef Algorithm_parameters  < handle
    %% Default properties
    properties
        %Inputs
        arms;
        last_trial;
        positive_rewards;
        negative_rewards;
    end
    %% Methods (CONSTRUCTOR)
    methods
        %Constructor method, having same name as class name which has a
        %variable number of inputs, to accomodate an object as the
        %input
        function obj=Algorithm_parameters(varargin)
            %Check if there is a handle passed in as the input. If it is,
            %set this objects's (obj) parameters as that one's and run the
            %commands.
            if nargin > 0
                %% TO VIEW HIDDEN PROPERTIES
                %To see the hidden settings, display mystruct values
                if ~isscalar(varargin{1})
                    current_play=obj.last_trial;
                    rewards=current_play;
                    rewards(rewards==-1)=0;
                    
                    
                    penalty=current_play;
                    penalty(penalty~=-1)=0;
                    penalty=penalty*(-1);
                    
                    obj.positive_rewards=obj.positive_rewards+rewards;
                    obj.negative_rewards=obj.negative_rewards+penalty;
                    
                else
                    obj.positive_rewards=zeros(1,varargin{1});
                    obj.negative_rewards=obj.positive_rewards;
                end
            else
                %% IF NO PARAMETERS ARE PASSED IN
                disp("Created an empty handle.")
            end
            
        end
    end
    
end

%%%%%%%%%%%%%%%%%%%%%Created by SAWAN SINGH MAHARA%%%%%%%%%%%%%%%%%%%%%%%%%