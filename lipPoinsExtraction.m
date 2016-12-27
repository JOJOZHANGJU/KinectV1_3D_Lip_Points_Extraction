%diary('D:\AudioVisualSpeechRecognition\newjob\project\3Dlippoint\log7.txt');
%diary on;
[Loadpath] = textread('Loadpath.txt','%s');
[Savepath] = textread('Savepath.txt','%s');
[row,cols] = size(Loadpath);
for a = 1:row
    filePath = Loadpath{a};
    filesave = Savepath{a};
    [date,index,x,y,z] = textread(filePath,'%s%f%f%f%f');
    start = sprintf('正在打开处理的位置是:%s\n',filePath);
    disp(start);
    data = [index,x,y,z];
    [r,c] = size(data);
    r = r/121;
    %time = strrep(time,':','-');
    for n = 1: r
        i = (n-1)*121;
        facePoint = cat(1,data((89+i),:),data((82+i),:),data((88+i),:),data((83+i),:),data((90+i),:),data((85+i),:),data((41+i),:),data((84+i),:),data((32+i),:),data((80+i),:),data((34+i),:),data((8+i),:),data((67+i),:),data((81+i),:),data((65+i),:),data((87+i),:),data((9+i),:),data((86+i),:));
        %t = time{(1+i)};
        fid = fopen([filesave,'\',num2str(n),'_','.txt'],'w');
        [nrows,ncols]= size(facePoint);
        for row=1:nrows
            fprintf(fid, '%.0f %.9f %.9f %.9f\n', facePoint(row,:));
        end
        fclose(fid);
        final = sprintf('处理好保存的位置是:%s\n',[filesave,'\',num2str(n),'_','.txt']);
        disp(final);
    end
end
%diary off;




