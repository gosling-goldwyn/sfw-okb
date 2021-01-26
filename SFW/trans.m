function [moved] = trans(height,width,Tinv)

moved=zeros(height,width,2);
outputView = imref2d([height,width]);
for i=1:height
    for j=1:width
        x=j+0.5;y=i+0.5; %固有座標に変換
        [x2,y2]=intrinsicToWorld(outputView,x,y); %世界座標に変換
        R=[x2,y2,1]*Tinv;
        [u,v]=worldToIntrinsic(outputView,R(1,1)/R(1,3),R(1,2)/R(1,3)); %移動後の世界座標を固有座標に変換
        u2=round(u-0.5);
        v2=round(v-0.5);
        if u2>0&&u2<width&&v2>0&&v2<height
            moved(i,j,1)=v2; %vはi軸
            moved(i,j,2)=u2; %uはj軸
        end
    end
end
end