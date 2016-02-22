#!/bin/bash

 # Script to make a streamable video from any type of video
 # It compresses the video and make a stream

#compression
#ffmpeg
  # -i [input file]
  # -codec:v [video codec name]
  # -profile:v [H.264 profile]
  # -preset [encoding rate]
  # -b:v [video bitrate]
  # -maxrate [device bitrate]
  # -bufsize [max bitrate]
  # -vf scale=[scale to resolution], ex : -1 = equal, format = width:height -> -vf scale=-1:320 (same width: height = 320)
  # -threads o [optimal threads]
  # -codec:a [audio codec name]
  # -b:a [audio bitrate]
  # -pass [current of pass]
  # -an = disable audio (useful when multipass for the first one to preserve CPU)

fileName=$1
fileNameLength=`expr ${#fileName} - 4`
fileNoExt=`expr substr $fileName 1 ${fileNameLength}`
echo -e "#EXTM3U" > playlist.m3u8

if [ $fileName ]
then
  echo "compression"

  echo "0 : Mobile 240p"
  mkdir 240p
  cd 240p
  echo "converting to .m3u8 sequence"
  # 240p (mobile)
  # other working with segments
  ffmpeg -y -i ../${fileName} -pix_fmt yuv420p -vcodec libx264 -acodec copy -r 25 -profile:v baseline -preset slow -b:v 240k -maxrate 240k -bufsize 480k -force_key_frames 50 -map 0 -flags -global_header -f segment -segment_list playlist.m3u8 -segment_time 2 -segment_format mpeg_ts -segment_list_type m3u8 ${fileNoExt}_240p%05d.ts

  cd ../
  echo -e "#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=10000" >> playlist.m3u8
  echo -e "240p/playlist.m3u8" >> playlist.m3u8

  echo "1 : Mobile 320p"
  mkdir 320p
  echo "converting to .m3u8 sequence"
  cd 320p
  #320p (mobile)
  # other working with segments
  ffmpeg -y -i ../${fileName} -pix_fmt yuv420p -vcodec libx264 -acodec copy -r 25 -profile:v baseline -preset slow -b:v 320k -maxrate 320k -bufsize 640k -force_key_frames 50 -map 0 -flags -global_header -f segment -segment_list playlist.m3u8 -segment_time 2 -segment_format mpeg_ts -segment_list_type m3u8 ${fileNoExt}_320p%05d.ts

  cd ../
  echo -e "#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=280000" >> playlist.m3u8
  echo -e "320p/playlist.m3u8" >> playlist.m3u8

  echo "2 : Mobile 360p"
  mkdir 360p
  echo "converting to .m3u8 sequence"
  cd 360p
  #360p
  # other working with segments
  ffmpeg -y -i ../${fileName} -pix_fmt yuv420p -vcodec libx264 -acodec copy -r 25 -profile:v baseline -preset slow -b:v 360k -maxrate 360k -bufsize 720k -force_key_frames 50 -map 0 -flags -global_header -f segment -segment_list playlist.m3u8 -segment_time 2 -segment_format mpeg_ts -segment_list_type m3u8 ${fileNoExt}_360p%05d.ts

  cd ../
  echo -e "#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=420000" >> playlist.m3u8
  echo -e "360p/playlist.m3u8" >> playlist.m3u8

  echo "3 : 480p"
  mkdir 480p
  echo "converting to .m3u8 sequence"
  cd 480p
  #480p
  # other working with segments
  ffmpeg -y -i ../${fileName} -pix_fmt yuv420p -vcodec libx264 -acodec copy -r 25 -profile:v baseline -preset slow -b:v 480k -maxrate 480k -bufsize 960k -force_key_frames 50 -map 0 -flags -global_header -f segment -segment_list playlist.m3u8 -segment_time 2 -segment_format mpeg_ts -segment_list_type m3u8 ${fileNoExt}_480p%05d.ts

  cd ../
  echo -e "#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=680000" >> playlist.m3u8
  echo -e "480p/playlist.m3u8" >> playlist.m3u8

  echo "4 : 576p"
  mkdir 576p
  echo "converting to .m3u8 sequence"
  cd 576p
  #576p
  # other working with segments
  ffmpeg -y -i ../${fileName} -pix_fmt yuv420p -vcodec libx264 -acodec copy -r 25 -profile:v baseline -preset slow -b:v 576k -maxrate 576k -bufsize 1152k -force_key_frames 50 -map 0 -flags -global_header -f segment -segment_list playlist.m3u8 -segment_time 2 -segment_format mpeg_ts -segment_list_type m3u8 ${fileNoExt}_576p%05d.ts

  cd ../
  echo -e "#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1000000" >> playlist.m3u8
  echo -e "576p/playlist.m3u8" >> playlist.m3u8

  echo "0 : 720p"
  mkdir 720p
  echo "converting to .m3u8 sequence"
  cd 720p
  #720p (mobile)
  # other working with segments
  ffmpeg -y -i ../${fileName} -pix_fmt yuv420p -vcodec libx264 -acodec copy -r 25 -profile:v baseline -preset slow -b:v 720k -maxrate 720k -bufsize 1240k -force_key_frames 50 -map 0 -flags -global_header -f segment -segment_list playlist.m3u8 -segment_time 2 -segment_format mpeg_ts -segment_list_type m3u8 ${fileNoExt}_720p%05d.ts

  cd ../
  echo -e "#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1256000" >> playlist.m3u8
  echo -e "720p/playlist.m3u8" >> playlist.m3u8

  echo "0 : 1080p"
  mkdir 1080p
  echo "converting to .m3u8 sequence"
  cd 1080p
  #1080p (mobile)
  # other working with segments
  ffmpeg -y -i ../${fileName} -pix_fmt yuv420p -vcodec libx264 -acodec copy -r 25 -profile:v baseline -preset slow -b:v 1080k -maxrate 1080k -bufsize 2060k -force_key_frames 50 -map 0 -flags -global_header -f segment -segment_list playlist.m3u8 -segment_time 2 -segment_format mpeg_ts -segment_list_type m3u8 ${fileNoExt}_1080p%05d.ts

  cd ../
  echo -e "#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2000000" >> playlist.m3u8
  echo -e "1080p/playlist.m3u8" >> playlist.m3u8
else
  echo "you must give a video file name"
fi
