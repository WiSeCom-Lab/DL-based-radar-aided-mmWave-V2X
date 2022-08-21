
close all
clear all

%% Init
data_files = ["ResRadcomm_MU_5","ResRadcomm_MU_6","ResRadcomm_MU_7","ResRadcomm_MU_8"];

%%

commdata_mat = zeros(6,16,25,4000);
raddata_mat = zeros(6,16,25,4000);
transceiver_params = struct();

% 1 - power (dB)
% 2 - toa
% 3 - AoD
% 4 - AoA
% 5 - LOS
% 6 - phase

cnt = 1;
empty_indices = [];
for data_file = data_files
    data = load(data_file);
    
    for sim_ind = 1:1000
        idx = sim_ind + 1000*(cnt-1);
        c = data.commdata(sim_ind);
        r = data.raddata(sim_ind);
        if isempty(c.P) || isempty(r.P)
            empty_indices = [empty_indices idx];
            continue;
        end
        for chan_ind = 1:16
            % Power
            commdata_mat(1,chan_ind,:,idx) = pow2db(c.P{chan_ind});
            raddata_mat(1,chan_ind,:,idx) = pow2db(r.P{chan_ind});
            
            % TOA
            commdata_mat(2,chan_ind,:,idx) = c.TOA{chan_ind};
            raddata_mat(2,chan_ind,:,idx) = r.TOA{chan_ind};
            
            % AoD
            commdata_mat(3,chan_ind,:,idx) = c.AOD{chan_ind};
            raddata_mat(3,chan_ind,:,idx) = r.AOD{chan_ind};
            
            % AoA
            commdata_mat(4,chan_ind,:,idx) = c.AOA{chan_ind};
            raddata_mat(4,chan_ind,:,idx) = r.AOA{chan_ind};
            
            % LOS
            commdata_mat(5,chan_ind,:,idx) = strcmp(c.state{chan_ind},'LOS');
            raddata_mat(5,chan_ind,:,idx) = strcmp(r.state{chan_ind},'LOS');
            
            % Phase
            commdata_mat(6,chan_ind,:,idx) = c.PHASE{chan_ind};
            raddata_mat(6,chan_ind,:,idx) = r.PHASE{chan_ind};
        end
    end
    
    cnt = cnt + 1;
end

%% Save
h5create('comm.h5','/channels',[6,16,25,4000]);
h5write('comm.h5','/channels',commdata_mat);

h5create('rad.h5','/channels',[6,16,25,4000]);
h5write('rad.h5','/channels',raddata_mat);
