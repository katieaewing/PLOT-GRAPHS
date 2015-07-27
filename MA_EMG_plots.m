figure(1)
plot(stance, [EMGNormfinal.VasLat__Processed, MActvNormFinal.vas_lat_r])

figure(2)
plot(stance, [EMGNormfinal.VasMed__Processed, MActvNormFinal.vas_med_r])

figure(3)
plot(stance, [EMGNormfinal.Soleus__Processed, MActvNormFinal.soleus_r])

figure(4)
plot(stance, [EMGNormfinal.RecFem__Processed, MActvNormFinal.rect_fem_r])

figure(5)
plot(stance, [EMGNormfinal.MedGastroc__Processed, MActvNormFinal.med_gas_r])

figure(6)
plot(stance, [EMGNormfinal.Semitend__Processed, MActvNormFinal.semiten_r])

figure(7)
plot(stance, [EMGNormfinal.BicepsFem__Processed, MActvNormFinal.bifemlh_r])

figure(8)
plot(stance, [EMGNormfinal.TibAnt__Processed, MActvNormFinal.tib_ant_r])
% 
% figure(9)
% plot(stance, [EMGNormfinal.GlutMed__Processed, MActvNormFinal.glut_med1_r])


  heading={'VAS LAT', 'VAS MED', 'SOL', 'RECFEM','MED GAS', 'SEMITEND', 'BICEPS FEM', 'TA','GLUTMED'};
   
    for i=1:9
        figure(i);
        title(heading(i));
    end


area(stance, [EMGNormfinal.VasLat__Processed])

figure(7)
plot(stance, [EMGTKEfinal.BicepsFem__Processed, MActvFinal.bifemlh_r])




figure(1)
plot(stance, [EMGTKENormfinal.VasLat__Processed, MActvNormFinal.vas_lat_r])

figure(2)
plot(stance, [EMGTKENormfinal.VasMed__Processed, MActvNormFinal.vas_med_r])

figure(3)
plot(stance, [EMGTKENormfinal.Soleus__Processed, MActvNormFinal.soleus_r])

figure(4)
plot(stance, [EMGTKENormfinal.RecFem__Processed, MActvNormFinal.rect_fem_r])

figure(5)
plot(stance, [EMGTKENormfinal.MedGastroc__Processed, MActvNormFinal.med_gas_r])

figure(6)
plot(stance, [EMGTKENormfinal.Semitend__Processed, MActvNormFinal.semiten_r])

figure(7)
plot(stance, [EMGTKENormfinal.BicepsFem__Processed, MActvNormFinal.bifemlh_r])

figure(8)
plot(stance, [EMGTKENormfinal.TibAnt__Processed, MActvNormFinal.tib_ant_r])

figure(9)
% plot(stance, [EMGTKENormfinal.GlutMed__Processed, MActvNormFinal.glut_med1_r])

  heading={'VAS LAT', 'VAS MED', 'SOL', 'RECFEM','MED GAS', 'SEMITEND', 'BICEPS FEM', 'TA','GLUTMED'};
   
    for i=1:9
        figure(i);
        title(heading(i));
    end




figure(1)
plot(stance, [EMGTKENormfinal.VasLat__Processed, MFfinal_BW.vas_lat_r])

figure(2)
plot(stance, [EMGTKENormfinal.VasMed__Processed, MFfinal_BW.vas_med_r])

figure(3)
plot(stance, [EMGTKENormfinal.Soleus__Processed, MFfinal_BW.soleus_r])

figure(4)
plot(stance, [EMGTKENormfinal.RecFem__Processed, MFfinal_BW.rect_fem_r])

figure(5)
plot(stance, [EMGTKENormfinal.MedGastroc__Processed, MFfinal_BW.med_gas_r])

figure(6)
plot(stance, [EMGTKENormfinal.Semitend__Processed, MFfinal_BW.semiten_r])

figure(7)
plot(stance, [EMGTKENormfinal.BicepsFem__Processed, MFfinal_BW.bifemlh_r])

figure(8)
plot(stance, [EMGTKENormfinal.TibAnt__Processed, MFfinal_BW.tib_ant_r])

figure(9)
% plot(stance, [EMGTKENormfinal.GlutMed__Processed, MFfinal_BW.glut_med1_r])

  heading={'VAS LAT', 'VAS MED', 'SOL', 'RECFEM','MED GAS', 'SEMITEND', 'BICEPS FEM', 'TA','GLUTMED'};
   
    for i=1:9
        figure(i);
        title(heading(i));
    end




figure(1)
plot(stance, [EMGTKENormfinal.VasLat__Processed])

figure(2)
plot(stance, [EMGTKENormfinal.VasMed__Processed])

figure(3)
plot(stance, [EMGTKENormfinal.Soleus__Processed])

figure(4)
plot(stance, [EMGTKENormfinal.RecFem__Processed])

figure(5)
plot(stance, [EMGTKENormfinal.MedGastroc__Processed])

figure(6)
plot(stance, [EMGTKENormfinal.Semitend__Processed])

figure(7)
plot(stance, [EMGTKENormfinal.BicepsFem__Processed])

figure(8)
plot(stance, [EMGTKENormfinal.TibAnt__Processed])

figure(9)
plot(stance, [EMGTKENormfinal.GlutMed__Processed])






figure(1)
plot(stance, [EMGNormfinal.VasLat__Raw, MActvNormFinal.vas_lat_r])

figure(2)
plot(stance, [EMGNormfinal.VasMed__Raw, MActvNormFinal.vas_med_r])

figure(3)
plot(stance, [EMGNormfinal.Soleus__Raw, MActvNormFinal.soleus_r])

figure(4)
plot(stance, [EMGNormfinal.RecFem__Raw, MActvNormFinal.rect_fem_r])

figure(5)
plot(stance, [EMGNormfinal.MedGastroc__Raw, MActvNormFinal.med_gas_r])

figure(6)
plot(stance, [EMGNormfinal.Semitend__Raw, MActvNormFinal.semiten_r])

figure(7)
plot(stance, [EMGNormfinal.BicepsFem__Raw, MActvNormFinal.bifemlh_r])

figure(8)
plot(stance, [EMGNormfinal.TibAnt__Raw, MActvNormFinal.tib_ant_r])

figure(9)
plot(stance, [EMGNormfinal.GlutMed__Raw, MActvNormFinal.glut_med1_r])

  heading={'VAS LAT', 'VAS MED', 'SOL', 'RECFEM','MED GAS', 'SEMITEND', 'BICEPS FEM', 'TA','GLUTMED'};
   
    for i=1:9
        figure(i);
        title(heading(i));
    end

    
    
    area(stance, [EMGTKENormfinal.VasLat__Processed])
        area(stance, [EMGNormfinal.VasLat__Processed])

    
    
    
    figure(1)
plot(stance, [MFfinal_BW.vas_lat_r, MActvNormFinal.vas_lat_r])

figure(2)
plot(stance, [MFfinal_BW.vas_med_r, MActvNormFinal.vas_med_r])

figure(3)
plot(stance, [MFfinal_BW.soleus_r, MActvNormFinal.soleus_r])

figure(4)
plot(stance, [MFfinal_BW.rect_fem_r, MActvNormFinal.rect_fem_r])

figure(5)
plot(stance, [MFfinal_BW.med_gas_r, MActvNormFinal.med_gas_r])

figure(6)
plot(stance, [MFfinal_BW.semiten_r, MActvNormFinal.semiten_r])

figure(7)
plot(stance, [MFfinal_BW.bifemlh_r, MActvNormFinal.bifemlh_r])

figure(8)
plot(stance, [MFfinal_BW.tib_ant_r, MActvNormFinal.tib_ant_r])

figure(9)
plot(stance, [MFfinal_BW.glut_med1_r, MActvNormFinal.glut_med1_r])

  heading={'VAS LAT', 'VAS MED', 'SOL', 'RECFEM','MED GAS', 'SEMITEND', 'BICEPS FEM', 'TA','GLUTMED'};
   
    for i=1:9
        figure(i);
        title(heading(i));
    end
    
    
    
    
    
    
    
    
    figure(1)
plot(stance, [EMGNormfinal.VasLat__Processed, MFfinal_BW.vas_lat_r])

figure(2)
plot(stance, [EMGNormfinal.VasMed__Processed, MFfinal_BW.vas_med_r])

figure(3)
plot(stance, [EMGNormfinal.Soleus__Processed, MFfinal_BW.soleus_r])

figure(4)
plot(stance, [EMGNormfinal.RecFem__Processed, MFfinal_BW.rect_fem_r])

figure(5)
plot(stance, [EMGNormfinal.MedGastroc__Processed, MFfinal_BW.med_gas_r])

figure(6)
plot(stance, [EMGNormfinal.Semitend__Processed, MFfinal_BW.semiten_r])

figure(7)
plot(stance, [EMGNormfinal.BicepsFem__Processed, MFfinal_BW.bifemlh_r])

figure(8)
plot(stance, [EMGNormfinal.TibAnt__Processed, MFfinal_BW.tib_ant_r])

figure(9)
% plot(stance, [EMGTKENormfinal.GlutMed__Processed, MFfinal_BW.glut_med1_r])

  heading={'VAS LAT', 'VAS MED', 'SOL', 'RECFEM','MED GAS', 'SEMITEND', 'BICEPS FEM', 'TA','GLUTMED'};
   
    for i=1:9
        figure(i);
        title(heading(i));
    end



    
    
    
    
figure(1)
plot(stance, [EMGNormfinal.VasLat__Processed + EMGNormfinal.VasMed__Processed, MActvNormFinal.vas_lat_r + MActvNormFinal.vas_med_r])


figure(3)
plot(stance, [EMGNormfinal.Soleus__Processed, MActvNormFinal.soleus_r])

figure(4)
plot(stance, [EMGNormfinal.RecFem__Processed, MActvNormFinal.rect_fem_r])

figure(5)
plot(stance, [EMGNormfinal.MedGastroc__Processed, MActvNormFinal.med_gas_r])

figure(6)
plot(stance, [EMGNormfinal.Semitend__Processed + EMGNormfinal.BicepsFem__Processed, MActvNormFinal.semiten_r + MActvNormFinal.bifemlh_r])

figure(7)
plot(stance, [EMGNormfinal.BicepsFem__Processed, MActvNormFinal.bifemlh_r])

figure(8)
plot(stance, [EMGNormfinal.TibAnt__Processed, MActvNormFinal.tib_ant_r])
% 
% figure(9)
% plot(stance, [EMGNormfinal.GlutMed__Processed, MActvNormFinal.glut_med1_r])


  heading={'VAS LAT', 'VAS MED', 'SOL', 'RECFEM','MED GAS', 'SEMITEND', 'BICEPS FEM', 'TA','GLUTMED'};
   
    for i=1:9
        figure(i);
        title(heading(i));
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    figure(1)
plot(stance, [EMGNormfinal.VasLat__Processed, EMGTKENormfinal.VasLat__Processed])

figure(2)
plot(stance, [EMGNormfinal.VasMed__Processed,EMGTKENormfinal.VasMed__Processed])

figure(3)
plot(stance, [EMGNormfinal.Soleus__Processed, EMGTKENormfinal.Soleus__Processed])

figure(4)
plot(stance, [EMGNormfinal.RecFem__Processed, EMGTKENormfinal.RecFem__Processed])

figure(5)
plot(stance, [EMGNormfinal.MedGastroc__Processed, EMGTKENormfinal.MedGastroc__Processed])

figure(6)
plot(stance, [EMGNormfinal.Semitend__Processed, EMGTKENormfinal.Semitend__Processed])

figure(7)
plot(stance, [EMGNormfinal.BicepsFem__Processed,EMGTKENormfinal.BicepsFem__Processed])

figure(8)
plot(stance, [EMGNormfinal.TibAnt__Processed, EMGTKENormfinal.TibAnt__Processed])
% 
% figure(9)
% plot(stance, [EMGNormfinal.GlutMed__Processed, MActvNormFinal.glut_med1_r])


  heading={'VAS LAT', 'VAS MED', 'SOL', 'RECFEM','MED GAS', 'SEMITEND', 'BICEPS FEM', 'TA','GLUTMED'};
   
    for i=1:9
        figure(i);
        title(heading(i));
    end
    
    
    
    
    
    
        figure(1)
plot(stance, [EMGNormfinal.VasLat__Processed, EMGTKENormfinal.VasLat__Processed, MActvNormFinal.vas_lat_r])

figure(2)
plot(stance, [EMGNormfinal.VasMed__Processed,EMGTKENormfinal.VasMed__Processed, MActvNormFinal.vas_med_r])

figure(3)
plot(stance, [EMGNormfinal.Soleus__Processed, EMGTKENormfinal.Soleus__Processed, MActvNormFinal.soleus_r])

figure(4)
plot(stance, [EMGNormfinal.RecFem__Processed, EMGTKENormfinal.RecFem__Processed, MActvNormFinal.rect_fem_r])

figure(5)
plot(stance, [EMGNormfinal.MedGastroc__Processed, EMGTKENormfinal.MedGastroc__Processed, MActvNormFinal.med_gas_r])

figure(6)
plot(stance, [EMGNormfinal.Semitend__Processed, EMGTKENormfinal.Semitend__Processed, MActvNormFinal.semiten_r])

figure(7)
plot(stance, [EMGNormfinal.BicepsFem__Processed,EMGTKENormfinal.BicepsFem__Processed, MActvNormFinal.bifemlh_r])

figure(8)
plot(stance, [EMGNormfinal.TibAnt__Processed, EMGTKENormfinal.TibAnt__Processed, MActvNormFinal.tib_ant_r])

figure(9)
plot(stance, [EMGNormfinal.GlutMed__Processed, MActvNormFinal.glut_med1_r, MActvNormFinal.glut_med1_r])


  heading={'VAS LAT', 'VAS MED', 'SOL', 'RECFEM','MED GAS', 'SEMITEND', 'BICEPS FEM', 'TA','GLUTMED'};
   
    for i=1:9
        figure(i);
        title(heading(i));
    end
    
    
    