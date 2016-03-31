% STL文件解析
% 二进制STL文件用固定的字节数来给出三角面片的几何信息。
% 文件起始的80个字节是文件头，用于存贮文件名；
% 紧接着用 4 个字节的整数来描述模型的三角面片个数，
% 后面逐个给出每个三角面片的几何信息。每个三角面片占用固定的50个字节，依次是:
% 3个4字节浮点数(角面片的法矢量)
% 3个4字节浮点数(1个顶点的坐标)
% 3个4字节浮点数(2个顶点的坐标)
% 3个4字节浮点数(3个顶点的坐标)个
% 三角面片的最后2个字节用来描述三角面片的属性信息。
% 一个完整二进制STL文件的大小为三角形面片数乘以 50再加上84个字节。
function [v, f,numFaces] = stlread(filename)

fid=fopen(filename, 'r');  %打开STL文件并且程序只是读取二进制格式
if fid == -1 
    error('File could not be opened, check name or path.')
end

ftitle=fread(fid,80,'uchar=>schar'); % Read file title
numFaces=fread(fid,1,'int32'); % Read number of Faces

T = fread(fid,inf,'uint8=>uint8'); % read the remaining values
fclose(fid);                        %返回序列T

% Each facet is 50 bytes 每一个行都由此构成
%  - Three single precision values specifying the face normal vector
%  - Three single precision values specifying the first vertex (XYZ)
%  - Three single precision values specifying the second vertex (XYZ)
%  - Three single precision values specifying the third vertex (XYZ)
%  - Two color bytes (possibly zeroed)

f = reshape(1:3*numFaces,[3,numFaces])';   %获取面的个数

ind = reshape(repmat(50*(0:(numFaces-1)),[48,1]),[1,48*numFaces])+repmat(1:48,[1,numFaces]); % ç”Ÿæˆ[1-48:51-98.....]
Tri = reshape(typecast(T(ind),'single'),[3,4,numFaces]);

v=Tri(:,2:4,:);
v = reshape(v,[3,3*numFaces]);
v = double(v)';
