image_xscale=0.75;
image_yscale=0.75;
image_blend=c_black;
multiplicadorAgito=1;
divisorMovimento=50;
xFX=x;
yFX=y;
xFoco=x-(100*multiplicadorAgito)+random(200*multiplicadorAgito);
yFoco=y-(100*multiplicadorAgito)+random(200*multiplicadorAgito);
alarm[0]=(120/multiplicadorAgito)-(5+random(10));
fisgado=false;
particulas=part_system_create_layer(layer,false,psBolhas);
part_system_automatic_draw(particulas,false);