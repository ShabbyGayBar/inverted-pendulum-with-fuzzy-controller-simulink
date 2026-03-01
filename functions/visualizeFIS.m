function [fig1,fig2,fig3,fig4,fig5] = visualizeFIS(fis,mdlName)
%  VISUALIZEFIS Visualize fuzzy controller
% 
% Plot the block diagram, control surface, and member functions of the fuzzy 
% controller. Export to designated image.
arguments (Input)
    fis (1,1)
    mdlName
end
arguments (Output)
    fig1
    fig2
    fig3
    fig4
    fig5
end
%%
% plot block diagram
fig1 = figure('Position',[0 0 400 240],'Units','points');
plotfis(fis);
fontname('TeXGyreTermes');
fontsize(10,"points");
exportgraphics(fig1,"figures/"+mdlName+"_plotfis.svg");
%%
% plot control surface
fig2 = figure('Position',[0 0 400 240],'Units','points');
gensurf(fis);
view([167.0 25.5]);
fontname(fig2,'TeXGyreTermes');
fontsize(fig2,10,"points");
exportgraphics(fig2,"figures/"+mdlName+"_gensurf.svg");
%%
% plot member functions
fig3 = figure('Position',[0 0 400 200],'Units','points');
fontname(fig3,'TeXGyreTermes');
fontsize(fig3,10,"points");
plotmf(fis,"input",1);
exportgraphics(fig3,"figures/"+mdlName+"_plotmf_error.svg");
%%
fig4 = figure('Position',[0 0 400 200],'Units','points');
fontname(fig4,'TeXGyreTermes');
fontsize(fig4,10,"points");
plotmf(fis,"input",2);
exportgraphics(fig4,"figures/"+mdlName+"_plotmf_change_in_error.svg");
%%
fig5 = figure('Position',[0 0 400 200],'Units','points');
fontname(fig5,'TeXGyreTermes');
fontsize(fig5,10,"points");
plotmf(fis,"output",1);
exportgraphics(fig5,"figures/"+mdlName+"_plotmf_force.svg");
end