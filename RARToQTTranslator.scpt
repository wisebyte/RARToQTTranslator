FasdUAS 1.101.10   ��   ��    k             l     ��  ��     !/usr/bin/osascript     � 	 	 & ! / u s r / b i n / o s a s c r i p t   
  
 l      ��  ��     Made by Meza Hsu Oct. 24th 2012 to solve the problem of DXP to ProRes conversion
version 8.1 2015.02.10
	Remove cycle twice add putting in a "plug" to work with the Gate Keeper
version 8.0 2014.10.16	Need to run the cycle twice, so that it will pick up anything else that came it after the script had triggered.	still working on this: Need the ability to prase episode and put the ProRes and DPX into the Final Cut Server.	Start and stop AME each time due to H264 crashing overtime - Adobe Media Encoder bugversion 7.0 2014.04	added a few more Gizmo expressions, change storage pointer to sbWorkspace, updated verbage to indicate that the corruption happens before the transfer not during the transfer	version 6.02 2014.03.27	stop multi-mount problem	version 6.01 2013.10.22	Just updated the error message to reflect the new naming convention.	Eliminated the FTP section since we are now getting it directly from FileCatalyst.	version 6.00 2013.06.12	It will now detect iteration number and add matching iteration naming to the dpx files	This will also split the script, so that moving after AME transcoding and notification are done separately and hopefully DAM will take over that part of the job eventually.	It's also possible now to have a watch folder script to delete files ready for processing instead of depending on timed cycles	version 5.00 2013.02.07	major changes:	detects .rar extension on incoming file, so resumeable upload that has temporary extension may be used	write out stats to help with auto reporting	remove almost all bash related scripting, so that it's more efficient	added dynamic configuration settings, so when it's on a brand new system it will prompt for configuration and save it in a preference file	converting by wrapping DPX into a MOV by using AJA's DPXToQTTranslator app., unfortunately the latest version is not Applescriptable, so have to do keystrokes	send to AME for conversion to H264 and ProRes	wait for AME to finish	rename the files then send to proper RAID destinations     �      M a d e   b y   M e z a   H s u   O c t .   2 4 t h   2 0 1 2   t o   s o l v e   t h e   p r o b l e m   o f   D X P   t o   P r o R e s   c o n v e r s i o n  
 v e r s i o n   8 . 1   2 0 1 5 . 0 2 . 1 0 
 	 R e m o v e   c y c l e   t w i c e   a d d   p u t t i n g   i n   a   " p l u g "   t o   w o r k   w i t h   t h e   G a t e   K e e p e r 
 v e r s i o n   8 . 0   2 0 1 4 . 1 0 . 1 6  	 N e e d   t o   r u n   t h e   c y c l e   t w i c e ,   s o   t h a t   i t   w i l l   p i c k   u p   a n y t h i n g   e l s e   t h a t   c a m e   i t   a f t e r   t h e   s c r i p t   h a d   t r i g g e r e d .  	 s t i l l   w o r k i n g   o n   t h i s :   N e e d   t h e   a b i l i t y   t o   p r a s e   e p i s o d e   a n d   p u t   t h e   P r o R e s   a n d   D P X   i n t o   t h e   F i n a l   C u t   S e r v e r .  	 S t a r t   a n d   s t o p   A M E   e a c h   t i m e   d u e   t o   H 2 6 4   c r a s h i n g   o v e r t i m e   -   A d o b e   M e d i a   E n c o d e r   b u g   v e r s i o n   7 . 0   2 0 1 4 . 0 4  	 a d d e d   a   f e w   m o r e   G i z m o   e x p r e s s i o n s ,   c h a n g e   s t o r a g e   p o i n t e r   t o   s b W o r k s p a c e ,   u p d a t e d   v e r b a g e   t o   i n d i c a t e   t h a t   t h e   c o r r u p t i o n   h a p p e n s   b e f o r e   t h e   t r a n s f e r   n o t   d u r i n g   t h e   t r a n s f e r  	  v e r s i o n   6 . 0 2   2 0 1 4 . 0 3 . 2 7  	 s t o p   m u l t i - m o u n t   p r o b l e m  	  v e r s i o n   6 . 0 1   2 0 1 3 . 1 0 . 2 2  	 J u s t   u p d a t e d   t h e   e r r o r   m e s s a g e   t o   r e f l e c t   t h e   n e w   n a m i n g   c o n v e n t i o n .  	 E l i m i n a t e d   t h e   F T P   s e c t i o n   s i n c e   w e   a r e   n o w   g e t t i n g   i t   d i r e c t l y   f r o m   F i l e C a t a l y s t .  	  v e r s i o n   6 . 0 0   2 0 1 3 . 0 6 . 1 2  	 I t   w i l l   n o w   d e t e c t   i t e r a t i o n   n u m b e r   a n d   a d d   m a t c h i n g   i t e r a t i o n   n a m i n g   t o   t h e   d p x   f i l e s  	 T h i s   w i l l   a l s o   s p l i t   t h e   s c r i p t ,   s o   t h a t   m o v i n g   a f t e r   A M E   t r a n s c o d i n g   a n d   n o t i f i c a t i o n   a r e   d o n e   s e p a r a t e l y   a n d   h o p e f u l l y   D A M   w i l l   t a k e   o v e r   t h a t   p a r t   o f   t h e   j o b   e v e n t u a l l y .  	 I t ' s   a l s o   p o s s i b l e   n o w   t o   h a v e   a   w a t c h   f o l d e r   s c r i p t   t o   d e l e t e   f i l e s   r e a d y   f o r   p r o c e s s i n g   i n s t e a d   o f   d e p e n d i n g   o n   t i m e d   c y c l e s  	  v e r s i o n   5 . 0 0   2 0 1 3 . 0 2 . 0 7  	 m a j o r   c h a n g e s :  	 d e t e c t s   . r a r   e x t e n s i o n   o n   i n c o m i n g   f i l e ,   s o   r e s u m e a b l e   u p l o a d   t h a t   h a s   t e m p o r a r y   e x t e n s i o n   m a y   b e   u s e d  	 w r i t e   o u t   s t a t s   t o   h e l p   w i t h   a u t o   r e p o r t i n g  	 r e m o v e   a l m o s t   a l l   b a s h   r e l a t e d   s c r i p t i n g ,   s o   t h a t   i t ' s   m o r e   e f f i c i e n t  	 a d d e d   d y n a m i c   c o n f i g u r a t i o n   s e t t i n g s ,   s o   w h e n   i t ' s   o n   a   b r a n d   n e w   s y s t e m   i t   w i l l   p r o m p t   f o r   c o n f i g u r a t i o n   a n d   s a v e   i t   i n   a   p r e f e r e n c e   f i l e  	 c o n v e r t i n g   b y   w r a p p i n g   D P X   i n t o   a   M O V   b y   u s i n g   A J A ' s   D P X T o Q T T r a n s l a t o r   a p p . ,   u n f o r t u n a t e l y   t h e   l a t e s t   v e r s i o n   i s   n o t   A p p l e s c r i p t a b l e ,   s o   h a v e   t o   d o   k e y s t r o k e s  	 s e n d   t o   A M E   f o r   c o n v e r s i o n   t o   H 2 6 4   a n d   P r o R e s  	 w a i t   f o r   A M E   t o   f i n i s h  	 r e n a m e   t h e   f i l e s   t h e n   s e n d   t o   p r o p e r   R A I D   d e s t i n a t i o n s        l     ��������  ��  ��        l     ��������  ��  ��        l     ��  ��    1 + here's the .counter file dictionary below:     �   V   h e r e ' s   t h e   . c o u n t e r   f i l e   d i c t i o n a r y   b e l o w :      l         r         m     ����    o      ���� 0 good_counter    A ; line 1: to help generate a journal of good files processed     �   v   l i n e   1 :   t o   h e l p   g e n e r a t e   a   j o u r n a l   o f   g o o d   f i l e s   p r o c e s s e d     !   l    " # $ " r     % & % m    ����   & o      ���� 0 btrans_counter   # H B line 2: to help generate a journal of bad transfer files received    $ � ' ' �   l i n e   2 :   t o   h e l p   g e n e r a t e   a   j o u r n a l   o f   b a d   t r a n s f e r   f i l e s   r e c e i v e d !  ( ) ( l    * + , * r     - . - m    	����   . o      ���� 0 bname_counter   + G A line 3: to help generate a journal of badly named files received    , � / / �   l i n e   3 :   t o   h e l p   g e n e r a t e   a   j o u r n a l   o f   b a d l y   n a m e d   f i l e s   r e c e i v e d )  0 1 0 l     ��������  ��  ��   1  2 3 2 l     �� 4 5��   4 2 , Gizmo's closings� give him some personality    5 � 6 6 X   G i z m o ' s   c l o s i n g s &   g i v e   h i m   s o m e   p e r s o n a l i t y 3  7 8 7 l   < 9���� 9 r    < : ; : J    8 < <  = > = m     ? ? � @ @ * R e a d y   f o r   w a r p   s p e e d ! >  A B A m     C C � D D D C a n ' t   w a i t   f o r   t h e   n e x t   a d v e n t u r e ! B  E F E m     G G � H H  W o o h o o ! F  I J I m     K K � L L 2 R e a d y   f o r   t h e   n e x t   b a t c h ! J  M N M m     O O � P P F C a n ' t   w a i t   t o   s e e   t h e   n e x t   e p i s o d e ! N  Q R Q m     S S � T T , K e e p   u p   t h e   g o o d   w o r k ! R  U V U m     W W � X X R I   w i s h   P r o f e s s o r   Q u a n t u m   c a n   s e e   y o u   n o w ! V  Y Z Y m     [ [ � \ \  P i e c e ! Z  ] ^ ] m     _ _ � ` `  Y o u   r u l e ! ^  a b a m     c c � d d 2 T h a t ' s   t h e   w a y   I   l i k e   i t ! b  e f e m     g g � h h < I ' m   g l a d   y o u   a r e   s o   e f f i c i e n t ! f  i j i m     k k � l l > W o n d e r   w h e r e   w e   a r e   g o i n g   n e x t ! j  m n m m     o o � p p 6 I   h a v e   n o t   d e t e c t e d   a n   e r a , n  q r q m     s s � t t P B T W   D o   y o u   k n o w   w h e r e   C h r i s   a n d   J o y   a r e ? r  u v u m     w w � x x P I ' m   g o i n g   t o   c h a r g e   u p   a   b i t   a f t e r   t h i s , v  y z y m    " { { � | | H I   l i k e   t h a t   n e w   t h i n g   y o u   a r e   d o i n g ! z  } ~ } m   " %   � � �   D i d   y o u   m i s s   m e ? ~  � � � m   % ( � � � � � < I   c a n ' t   w a i t   t o   w o r k   w i t h   D A M ! �  � � � m   ( + � � � � � B I   h a v e   a n   i d e a   f o r   a   g r e a t   s t o r y ! �  � � � m   + . � � � � � < I   t h i n k   I ' m   g e t t i n g   a   S h o t g u n . �  � � � m   . 1 � � � � � P F i n a l l y ,   s t o r a g e   m i g r a t i o n   i s   c o m p l e t e d . �  ��� � m   1 4 � � � � � 8 I t ' s   t i m e   f o r   t h e   n e x t   t i m e !��   ; o      ���� 0 gizmoto  ��  ��   8  � � � l     ��������  ��  ��   �  � � � l     �� � ���   �   notification lists    � � � � &   n o t i f i c a t i o n   l i s t s �  � � � l  = D � � � � r   = D � � � m   = @ � � � � �  G o o d   R A R � o      ���� 0 notify_good   � y s make sure the AddressBook contains both of these groups, make this into official Exchange notification group later    � � � � �   m a k e   s u r e   t h e   A d d r e s s B o o k   c o n t a i n s   b o t h   o f   t h e s e   g r o u p s ,   m a k e   t h i s   i n t o   o f f i c i a l   E x c h a n g e   n o t i f i c a t i o n   g r o u p   l a t e r �  � � � l  E L ����� � r   E L � � � m   E H � � � � �  B a d   R A R � o      ���� 0 
notify_bad  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � � | read from preference file then mount if preference file exists� if not ask for paths then write it out to a preference file    � � � � �   r e a d   f r o m   p r e f e r e n c e   f i l e   t h e n   m o u n t   i f   p r e f e r e n c e   f i l e   e x i s t s &   i f   n o t   a s k   f o r   p a t h s   t h e n   w r i t e   i t   o u t   t o   a   p r e f e r e n c e   f i l e �  � � � l  M j ����� � r   M j � � � b   M f � � � l  M b ����� � I  M b�� � �
�� .earsffdralis        afdr � m   M P��
�� afdrdlib � �� � �
�� 
from � m   S V��
�� fldmfldu � �� ���
�� 
rtyp � m   Y \��
�� 
TEXT��  ��  ��   � m   b e � � � � �  P r e f e r e n c e s : � o      ���� &0 preference_folder Preference_folder��  ��   �  � � � l  k v ����� � r   k v � � � b   k r � � � o   k n���� &0 preference_folder Preference_folder � m   n q � � � � � 8 c o m . m e z a . R A R 2 A J A . p r e f e r e n c e s � o      ���� 0 preferencefile  ��  ��   �  � � � l  w � � � � � O  w � � � � I  } �������
�� .ascrnoop****      � ****��  ��   � m   w z � �L                                                                                  ame   alis    �  Macintosh HD               ��%H+   �G�Adobe Media Encoder CC 2014.app                                 �G�Ѱ�(        ����  	                Adobe Media Encoder CC 2014     ���u      Ѱ�h     �G� z��  WMacintosh HD:Applications: Adobe Media Encoder CC 2014: Adobe Media Encoder CC 2014.app   @  A d o b e   M e d i a   E n c o d e r   C C   2 0 1 4 . a p p    M a c i n t o s h   H D  HApplications/Adobe Media Encoder CC 2014/Adobe Media Encoder CC 2014.app  / ��   �    startup the Media Encoder    � � � � 4   s t a r t u p   t h e   M e d i a   E n c o d e r �  � � � l  �� ����� � O   �� � � � k   �� � �  � � � l  � ���������  ��  ��   �  ��� � Z   �� � ��� � � I  � ��� ���
�� .coredoexbool        obj  � o   � ����� 0 preferencefile  ��   � k   � � � �  � � � r   � � � � � I  � ��� ���
�� .rdwropenshor       file � o   � ����� 0 preferencefile  ��   � o      ���� $0 thefilereference theFileReference �  � � � r   � � � � � I  � ��� � �
�� .rdwrread****        **** � o   � ����� $0 thefilereference theFileReference � �� ���
�� 
deli � o   � ���
�� 
ret ��   � o      ���� 0 parse_preferences   �  � � � I  � ��� ���
�� .rdwrclosnull���     **** � o   � ����� $0 thefilereference theFileReference��   �  � � � r   � � � � � n   � � � � � 4   � ��� �
�� 
cobj � m   � �����  � o   � ����� 0 parse_preferences   � o      ���� 0 storage_server   �  � � � r   � � � � � n   � � � � � 4   � ��� �
�� 
cobj � m   � �����  � o   � ����� 0 parse_preferences   � o      ���� 0 storage_base   �  �  � l  � �����   4 . set wtf_server to item 1 of parse_preferences    � \   s e t   w t f _ s e r v e r   t o   i t e m   1   o f   p a r s e _ p r e f e r e n c e s   l  � �����   2 , set wtf_base to item 2 of parse_preferences    � X   s e t   w t f _ b a s e   t o   i t e m   2   o f   p a r s e _ p r e f e r e n c e s 	
	 l  � �����   6 0 set raid1_server to item 3 of parse_preferences    � `   s e t   r a i d 1 _ s e r v e r   t o   i t e m   3   o f   p a r s e _ p r e f e r e n c e s
  l  � �����   4 . set raid1_base to item 4 of parse_preferences    � \   s e t   r a i d 1 _ b a s e   t o   i t e m   4   o f   p a r s e _ p r e f e r e n c e s  l  � �����   6 0 set raid2_server to item 5 of parse_preferences    � `   s e t   r a i d 2 _ s e r v e r   t o   i t e m   5   o f   p a r s e _ p r e f e r e n c e s  l  � �����   4 . set raid2_base to item 6 of parse_preferences    � \   s e t   r a i d 2 _ b a s e   t o   i t e m   6   o f   p a r s e _ p r e f e r e n c e s  l  � ���������  ��  ��     r   � �!"! n   � �#$# 4   � ���%
�� 
cobj% m   � ����� $ o   � ����� 0 parse_preferences  " o      ���� 0 
local_base    &'& l  � �()*( r   � �+,+ n   � �-.- 4   � ���/
�� 
cobj/ m   � ����� . o   � ����� 0 parse_preferences  , o      ���� 0 ame_base  ) ' ! Adobe Media Encoder watch folder   * �00 B   A d o b e   M e d i a   E n c o d e r   w a t c h   f o l d e r' 121 l  � ���34��  3 A ; if not (exists disk wtf_base) then mount volume wtf_server   4 �55 v   i f   n o t   ( e x i s t s   d i s k   w t f _ b a s e )   t h e n   m o u n t   v o l u m e   w t f _ s e r v e r2 676 l  � ���89��  8 E ? if not (exists disk raid1_base) then mount volume raid1_server   9 �:: ~   i f   n o t   ( e x i s t s   d i s k   r a i d 1 _ b a s e )   t h e n   m o u n t   v o l u m e   r a i d 1 _ s e r v e r7 ;��; l  � ���<=��  < E ? if not (exists disk raid2_base) then mount volume raid2_server   = �>> ~   i f   n o t   ( e x i s t s   d i s k   r a i d 2 _ b a s e )   t h e n   m o u n t   v o l u m e   r a i d 2 _ s e r v e r��  ��   � k   ��?? @A@ l  � ���BC��  B l f display dialog "Path to WAN Transferred Files Server:" default answer "smb://ftp.cbn.org/superbookwk"   C �DD �   d i s p l a y   d i a l o g   " P a t h   t o   W A N   T r a n s f e r r e d   F i l e s   S e r v e r : "   d e f a u l t   a n s w e r   " s m b : / / f t p . c b n . o r g / s u p e r b o o k w k "A EFE l  � ���GH��  G 0 * set wtf_server to text returned of result   H �II T   s e t   w t f _ s e r v e r   t o   t e x t   r e t u r n e d   o f   r e s u l tF JKJ l  � ���LM��  L e _ display dialog "Path to Superbook RAID:" default answer "afp://superbook-server/SB 28TB RAID/"   M �NN �   d i s p l a y   d i a l o g   " P a t h   t o   S u p e r b o o k   R A I D : "   d e f a u l t   a n s w e r   " a f p : / / s u p e r b o o k - s e r v e r / S B   2 8 T B   R A I D / "K OPO l  � ���QR��  Q 2 , set raid1_server to text returned of result   R �SS X   s e t   r a i d 1 _ s e r v e r   t o   t e x t   r e t u r n e d   o f   r e s u l tP TUT l  � ���VW��  V g a display dialog "Path to Superbook RAID2:" default answer "afp://superbook-server/SB 28TB RAID2/"   W �XX �   d i s p l a y   d i a l o g   " P a t h   t o   S u p e r b o o k   R A I D 2 : "   d e f a u l t   a n s w e r   " a f p : / / s u p e r b o o k - s e r v e r / S B   2 8 T B   R A I D 2 / "U YZY l  � ���[\��  [ 2 , set raid2_server to text returned of result   \ �]] X   s e t   r a i d 2 _ s e r v e r   t o   t e x t   r e t u r n e d   o f   r e s u l tZ ^_^ I  ���`a
�� .sysodlogaskr        TEXT` m   � �bb �cc 4 P a t h   t o   S u p e r b o o k   S t o r a g e :a ��d��
�� 
dtxtd m   � �ee �ff ` n f s : / / n l . n a s . c b n . l o c a l / i f s / S u p e r b o o k / s b W o r k s p a c e��  _ ghg r  iji n  	klk 1  	��
�� 
ttxtl 1  ��
�� 
rsltj o      ���� 0 storage_server  h mnm l ��������  ��  ��  n opo Q  $qrsq t  tut k  vv wxw l ��yz��  y   mount volume wtf_server   z �{{ 0   m o u n t   v o l u m e   w t f _ s e r v e rx |}| l ��~��  ~    mount volume raid1_server    ��� 4   m o u n t   v o l u m e   r a i d 1 _ s e r v e r} ���� l ������  �   	mount volume raid2_server   � ��� 4 	 m o u n t   v o l u m e   r a i d 2 _ s e r v e r��  u m  �����r R      ����~
�� .ascrerr ****      � ****�  �~  s I $�}�|�{
�} .aevtquitnull��� ��� null�|  �{  p ��� l %%�z�y�x�z  �y  �x  � ��� l %%�w���w  � R L	set wtf_base to choose folder with prompt "Mounted WAN Transferred Folder:"   � ��� � 	 s e t   w t f _ b a s e   t o   c h o o s e   f o l d e r   w i t h   p r o m p t   " M o u n t e d   W A N   T r a n s f e r r e d   F o l d e r : "� ��� l %%�v���v  � ) #	set wtf_base to wtf_base as string   � ��� F 	 s e t   w t f _ b a s e   t o   w t f _ b a s e   a s   s t r i n g� ��� l %%�u���u  � M G	set raid1_base to choose folder with prompt "Mounted Superbook RAID1:"   � ��� � 	 s e t   r a i d 1 _ b a s e   t o   c h o o s e   f o l d e r   w i t h   p r o m p t   " M o u n t e d   S u p e r b o o k   R A I D 1 : "� ��� l %%�t���t  � = 7	set raid1_base to {raid1_base, "Converted:"} as string   � ��� n 	 s e t   r a i d 1 _ b a s e   t o   { r a i d 1 _ b a s e ,   " C o n v e r t e d : " }   a s   s t r i n g� ��� l %%�s���s  � M G	set raid2_base to choose folder with prompt "Mounted Superbook RAID2:"   � ��� � 	 s e t   r a i d 2 _ b a s e   t o   c h o o s e   f o l d e r   w i t h   p r o m p t   " M o u n t e d   S u p e r b o o k   R A I D 2 : "� ��� l %%�r���r  � = 7	set raid2_base to {raid2_base, "Converted:"} as string   � ��� n 	 s e t   r a i d 2 _ b a s e   t o   { r a i d 2 _ b a s e ,   " C o n v e r t e d : " }   a s   s t r i n g� ��� r  %4��� I %0�q�p�
�q .sysostflalis    ��� null�p  � �o��n
�o 
prmp� m  ),�� ��� B W h e r e   t o   p u t   t h e   c o n v e r t e d   f i l e s :�n  � o      �m�m 0 storage_base  � ��� r  5E��� c  5A��� J  5=�� ��� o  58�l�l 0 storage_base  � ��k� m  8;�� ���  C o n v e r t e d :�k  � m  =@�j
�j 
TEXT� o      �i�i 0 storage_base  � ��� l FF�h�g�f�h  �g  �f  � ��� r  FU��� I FQ�e�d�
�e .sysostflalis    ��� null�d  � �c��b
�c 
prmp� m  JM�� ��� D C h o o s e   l o c a t i o n   f o r   l o c a l   c a c h i n g :�b  � o      �a�a 0 
local_base  � ��� r  Va��� c  V]��� o  VY�`�` 0 
local_base  � m  Y\�_
�_ 
TEXT� o      �^�^ 0 
local_base  � ��� r  bq��� I bm�]�\�
�] .sysostflalis    ��� null�\  � �[��Z
�[ 
prmp� m  fi�� ��� B A d o b e   M e d i a   E n c o d e r   W a t c h   F o l d e r :�Z  � o      �Y�Y 0 ame_base  � ��� r  r}��� c  ry��� o  ru�X�X 0 ame_base  � m  ux�W
�W 
TEXT� o      �V�V 0 ame_base  � ��� l ~~�U�T�S�U  �T  �S  � ��� r  ~���� I ~��R��
�R .rdwropenshor       file� o  ~��Q�Q 0 preferencefile  � �P��O
�P 
perm� m  ���N
�N boovtrue�O  � o      �M�M $0 thefilereference theFileReference� ��� I ���L��
�L .rdwrseofnull���     ****� o  ���K�K $0 thefilereference theFileReference� �J��I
�J 
set2� m  ���H�H  �I  � ��� l ���G���G  �B<	write (wtf_server as string) & return & (wtf_base as string) & return & (raid1_server as string) & return & (raid1_base as string) & return & (raid2_server as string) & return & (raid2_base as string) & return & (local_base as string) & return & (ame_base as string) & return to the theFileReference starting at eof   � ���x 	 w r i t e   ( w t f _ s e r v e r   a s   s t r i n g )   &   r e t u r n   &   ( w t f _ b a s e   a s   s t r i n g )   &   r e t u r n   &   ( r a i d 1 _ s e r v e r   a s   s t r i n g )   &   r e t u r n   &   ( r a i d 1 _ b a s e   a s   s t r i n g )   &   r e t u r n   &   ( r a i d 2 _ s e r v e r   a s   s t r i n g )   &   r e t u r n   &   ( r a i d 2 _ b a s e   a s   s t r i n g )   &   r e t u r n   &   ( l o c a l _ b a s e   a s   s t r i n g )   &   r e t u r n   &   ( a m e _ b a s e   a s   s t r i n g )   &   r e t u r n   t o   t h e   t h e F i l e R e f e r e n c e   s t a r t i n g   a t   e o f� ��� I ���F��
�F .rdwrwritnull���     ****� b  ����� b  ����� b  ����� b  ����� b  ����� b  ����� b  ����� l ����E�D� c  ����� o  ���C�C 0 storage_server  � m  ���B
�B 
TEXT�E  �D  � o  ���A
�A 
ret � l ����@�?� c  ��   o  ���>�> 0 storage_base   m  ���=
�= 
TEXT�@  �?  � o  ���<
�< 
ret � l ���;�: c  �� o  ���9�9 0 
local_base   m  ���8
�8 
TEXT�;  �:  � o  ���7
�7 
ret � l ���6�5 c  �� o  ���4�4 0 ame_base   m  ���3
�3 
TEXT�6  �5  � o  ���2
�2 
ret � �1	
�1 
refn l ��
�0�/
 o  ���.�. $0 thefilereference theFileReference�0  �/  	 �-�,
�- 
wrat m  ���+
�+ rdwreof �,  �  l ���*�)�(�*  �)  �(   �' I ���&�%
�& .rdwrclosnull���     **** o  ���$�$ $0 thefilereference theFileReference�%  �'  ��   � m   � ��                                                                                  MACS  alis    t  Macintosh HD               ��%H+   z��
Finder.app                                                      }�хx�        ����  	                CoreServices    ���u      х�7     z�� z�� z��  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  ��  ��   �  l     �#�"�!�#  �"  �!    l     � �    m g now that we know where local_base is set the posix equvilent so that we can unrar via the unrar binary    � �   n o w   t h a t   w e   k n o w   w h e r e   l o c a l _ b a s e   i s   s e t   t h e   p o s i x   e q u v i l e n t   s o   t h a t   w e   c a n   u n r a r   v i a   t h e   u n r a r   b i n a r y  l ���� r  �� n  �� 1  ���
� 
psxp o  ���� 0 
local_base   o      �� 0 posix_local_base  �  �     l     ����  �  �    !"! l     �#$�  # O I figure out the 8 digit date name to name the folder created for each day   $ �%% �   f i g u r e   o u t   t h e   8   d i g i t   d a t e   n a m e   t o   n a m e   t h e   f o l d e r   c r e a t e d   f o r   e a c h   d a y" &'& l �(��( r  �)*) c  ��+,+ n  ��-.- m  ���
� 
mnth. l ��/��/ I �����
� .misccurdldt    ��� null�  �  �  �  , m  ���
� 
long* o      �� 0 mm  �  �  ' 010 l !2342 Z !56��5 A  
787 o  �
�
 0 mm  8 m  	�	�	 
6 r  9:9 c  ;<; J  == >?> m  @@ �AA  0? B�B o  �� 0 mm  �  < m  �
� 
TEXT: o      �� 0 mm  �  �  3 9 3 put in an extra zero to make the file name uniform   4 �CC f   p u t   i n   a n   e x t r a   z e r o   t o   m a k e   t h e   f i l e   n a m e   u n i f o r m1 DED l "/F��F r  "/GHG n  "+IJI 1  '+�
� 
yearJ l "'K�� K I "'������
�� .misccurdldt    ��� null��  ��  �  �   H o      ���� 0 yy  �  �  E LML l 0AN����N r  0AOPO c  0=QRQ n  09STS 1  59��
�� 
day T l 05U����U I 05������
�� .misccurdldt    ��� null��  ��  ��  ��  R m  9<��
�� 
longP o      ���� 0 dd  ��  ��  M VWV l B`XYZX Z B`[\����[ A  BI]^] o  BE���� 0 dd  ^ m  EH���� 
\ r  L\_`_ c  LXaba J  LTcc ded m  LOff �gg  0e h��h o  OR���� 0 dd  ��  b m  TW��
�� 
TEXT` o      ���� 0 dd  ��  ��  Y 9 3 put in an extra zero to make the file name uniform   Z �ii f   p u t   i n   a n   e x t r a   z e r o   t o   m a k e   t h e   f i l e   n a m e   u n i f o r mW jkj l a|l����l r  a|mnm c  axopo J  atqq rsr o  ad���� 0 yy  s tut m  dgvv �ww  -u xyx o  gj���� 0 mm  y z{z m  jm|| �}}  -{ ~��~ o  mp���� 0 dd  ��  p m  tw��
�� 
TEXTn o      ���� 0 date_folder  ��  ��  k � l }������� r  }���� c  }���� J  }��� ��� o  }����� 0 yy  � ��� o  ������ 0 mm  � ���� o  ������ 0 dd  ��  � m  ����
�� 
TEXT� o      ���� 	0 dated  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � L F check to see if the needed sub-folders exist, if not then create them   � ��� �   c h e c k   t o   s e e   i f   t h e   n e e d e d   s u b - f o l d e r s   e x i s t ,   i f   n o t   t h e n   c r e a t e   t h e m� ��� l �a������ O  �a��� k  �`�� ��� r  ����� b  ����� o  ������ 0 
local_base  � m  ���� ���  r a r :� o      ���� 0 
folder_add  � ��� Z ��������� H  ���� l �������� I �������
�� .coredoexbool        obj � 4  �����
�� 
cfol� o  ������ 0 
folder_add  ��  ��  ��  � I �������
�� .corecrel****      � null��  � ����
�� 
kocl� m  ����
�� 
cfol� ����
�� 
insh� o  ������ 0 
local_base  � �����
�� 
prdt� K  ���� �����
�� 
pnam� m  ���� ���  r a r��  ��  ��  ��  � ��� r  ����� b  ����� o  ������ 0 
local_base  � m  ���� ���  r a r :� o      ���� 0 lrar_folder  � ��� l ����������  ��  ��  � ��� l ������ r  ����� b  ����� o  ������ 0 lrar_folder  � m  ���� ���  w o r k i n g :� o      ���� 0 
folder_add  � l f making the "plug" folder so no more files will come into the queue when the script is already working   � ��� �   m a k i n g   t h e   " p l u g "   f o l d e r   s o   n o   m o r e   f i l e s   w i l l   c o m e   i n t o   t h e   q u e u e   w h e n   t h e   s c r i p t   i s   a l r e a d y   w o r k i n g� ��� Z �$������� H  ���� l �������� I �������
�� .coredoexbool        obj � 4  �����
�� 
cfol� o  ������ 0 
folder_add  ��  ��  ��  � I � �����
�� .corecrel****      � null��  � ����
�� 
kocl� m  ��
�� 
cfol� ����
�� 
insh� b  ��� o  ���� 0 
local_base  � m  �� ���  r a r :� �����
�� 
prdt� K  �� �����
�� 
pnam� m  �� ���  w o r k i n g��  ��  ��  ��  � ��� r  %0��� b  %,��� o  %(���� 0 
local_base  � m  (+�� ���  r a r : w o r k i n g :� o      ���� 0 plug_folder  � ��� l 11��������  ��  ��  � ��� r  1<��� b  18��� o  14���� 0 
local_base  � m  47�� ���  a j a :� o      ���� 0 
folder_add  � ��� Z =o������� H  =J�� l =I������ I =I�����
�� .coredoexbool        obj � 4  =E���
�� 
cfol� o  AD���� 0 
folder_add  ��  ��  ��  � I Mk�����
�� .corecrel****      � null��  � ����
�� 
kocl� m  QT��
�� 
cfol� ����
�� 
insh� o  WZ���� 0 
local_base  � �� ��
�� 
prdt  K  ]e ����
�� 
pnam m  `c �  a j a��  ��  ��  ��  �  r  p{ b  pw	
	 o  ps���� 0 
local_base  
 m  sv �  a j a : o      ���� 0 
aja_folder    l ||��������  ��  ��    r  |� b  |� o  |���� 0 
local_base   m  � �  l o g o      ���� 0 
folder_add    Z ������ H  �� l ������ I ����~
� .coredoexbool        obj  4  ���}
�} 
cfol o  ���|�| 0 
folder_add  �~  ��  ��   I ���{�z
�{ .corecrel****      � null�z   �y !
�y 
kocl  m  ���x
�x 
cfol! �w"#
�w 
insh" o  ���v�v 0 
local_base  # �u$�t
�u 
prdt$ K  ��%% �s&�r
�s 
pnam& m  ��'' �((  l o g�r  �t  ��  ��   )*) r  ��+,+ b  ��-.- o  ���q�q 0 
local_base  . m  ��// �00  l o g :, o      �p�p 0 
log_folder  * 121 r  ��343 b  ��565 b  ��787 o  ���o�o 0 storage_base  8 m  ��99 �::  m p 4 :6 o  ���n�n 0 date_folder  4 o      �m�m 0 
folder_add  2 ;<; Z �=>�l�k= H  ��?? l ��@�j�i@ I ���hA�g
�h .coredoexbool        obj A 4  ���fB
�f 
cfolB o  ���e�e 0 
folder_add  �g  �j  �i  > I �	�d�cC
�d .corecrel****      � null�c  C �bDE
�b 
koclD m  ���a
�a 
cfolE �`FG
�` 
inshF l ��H�_�^H b  ��IJI o  ���]�] 0 storage_base  J m  ��KK �LL  m p 4 :�_  �^  G �\M�[
�\ 
prdtM K  �NN �ZO�Y
�Z 
pnamO o  ��X�X 0 date_folder  �Y  �[  �l  �k  < PQP r  RSR b  TUT b  VWV o  �W�W 0 storage_base  W m  XX �YY  P r o R e s :U o  �V�V 0 date_folder  S o      �U�U 0 
folder_add  Q Z[Z Z T\]�T�S\ H  +^^ l *_�R�Q_ I *�P`�O
�P .coredoexbool        obj ` 4  &�Na
�N 
cfola o  "%�M�M 0 
folder_add  �O  �R  �Q  ] I .P�L�Kb
�L .corecrel****      � null�K  b �Jcd
�J 
koclc m  25�I
�I 
cfold �Hef
�H 
inshe l 8?g�G�Fg b  8?hih o  8;�E�E 0 storage_base  i m  ;>jj �kk  P r o R e s :�G  �F  f �Dl�C
�D 
prdtl K  BJmm �Bn�A
�B 
pnamn o  EH�@�@ 0 date_folder  �A  �C  �T  �S  [ o�?o r  U`pqp l U\r�>�=r b  U\sts o  UX�<�< 0 ame_base  t m  X[uu �vv  o u t p u t :�>  �=  q o      �;�; 0 
ame_output  �?  � m  ��ww�                                                                                  MACS  alis    t  Macintosh HD               ��%H+   z��
Finder.app                                                      }�хx�        ����  	                CoreServices    ���u      х�7     z�� z�� z��  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  ��  ��  � xyx l     �:�9�8�:  �9  �8  y z{z l     �7�6�5�7  �6  �5  { |}| l     �4�3�2�4  �3  �2  } ~~ l     �1���1  � = 7 find if log of the day exists, if not create a new one   � ��� n   f i n d   i f   l o g   o f   t h e   d a y   e x i s t s ,   i f   n o t   c r e a t e   a   n e w   o n e ��� l bq��0�/� r  bq��� b  bm��� b  bi��� o  be�.�. 0 
log_folder  � o  eh�-�- 	0 dated  � m  il�� ���  . c o u n t e r� o      �,�, 0 counter_file  �0  �/  � ��� l r��+�*� O  r��� Z  x���)�� H  x��� l x���(�'� I x��&��%
�& .coredoexbool        obj � 4  x��$�
�$ 
file� o  |�#�# 0 counter_file  �%  �(  �'  � k  ���� ��� r  ����� I ���"��
�" .rdwropenshor       file� o  ���!�! 0 counter_file  � � ��
�  
perm� m  ���
� boovtrue�  � o      �� $0 thefilereference theFileReference� ��� I �����
� .rdwrseofnull���     ****� o  ���� $0 thefilereference theFileReference� ���
� 
set2� m  ����  �  � ��� I �����
� .rdwrwritnull���     ****� b  ����� b  ����� b  ����� b  ����� b  ����� m  ���� ���  0� o  ���
� 
ret � m  ���� ���  0� o  ���
� 
ret � m  ���� ���  0� o  ���
� 
ret � ���
� 
refn� o  ���� $0 thefilereference theFileReference� ���
� 
wrat� m  ���
� rdwreof �  � ��� I �����
� .rdwrclosnull���     ****� o  ���� $0 thefilereference theFileReference�  �  �)  � k  ��� ��� r  ����� I ���
��	
�
 .rdwropenshor       file� o  ���� 0 counter_file  �	  � o      �� $0 thefilereference theFileReference� ��� r  ����� I �����
� .rdwrread****        ****� o  ���� $0 thefilereference theFileReference� ���
� 
deli� o  ���
� 
ret �  � o      �� 0 parse_counter  � ��� I ��� ���
�  .rdwrclosnull���     ****� o  ������ $0 thefilereference theFileReference��  � ��� r  ���� n  ���� 4  ���
�� 
cobj� m  ���� � o  ����� 0 parse_counter  � o      ���� 0 good_counter  � ��� r  	��� n  	��� 4  ���
�� 
cobj� m  ���� � o  	���� 0 parse_counter  � o      ���� 0 btrans_counter  � ���� r  ��� n  ��� 4  ���
�� 
cobj� m  ���� � o  ���� 0 parse_counter  � o      ���� 0 bname_counter  ��  � m  ru���                                                                                  MACS  alis    t  Macintosh HD               ��%H+   z��
Finder.app                                                      }�хx�        ����  	                CoreServices    ���u      х�7     z�� z�� z��  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  �+  �*  � ��� l     ��������  ��  ��  � ��� l     ������  �   unrar section   � ���    u n r a r   s e c t i o n� ��� l  +������ r   +��� b   '��� o   #���� 0 
local_base  � m  #&�� ���  r a r :� o      ���� 0 lrar_folder  ��  ��  � ��� l ,2���� r  ,2��� J  ,.����  � o      ���� 0 	good_list  � � z clear out the good RAR files list before counting up each of the good RAR files to be included in the notification e-mail   � ��� �   c l e a r   o u t   t h e   g o o d   R A R   f i l e s   l i s t   b e f o r e   c o u n t i n g   u p   e a c h   o f   t h e   g o o d   R A R   f i l e s   t o   b e   i n c l u d e d   i n   t h e   n o t i f i c a t i o n   e - m a i l� ��� l     ��������  ��  ��  � � � l 3����� T  3� k  8�  O 8S r  >R	 n  >N

 1  JN��
�� 
pnam n  >J 2 FJ��
�� 
file 4  >F��
�� 
cfol o  BE���� 0 lrar_folder  	 o      ���� 0 drill_files   m  8;�                                                                                  MACS  alis    t  Macintosh HD               ��%H+   z��
Finder.app                                                      }�хx�        ����  	                CoreServices    ���u      х�7     z�� z�� z��  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��    Z Tb���� = TZ o  TW���� 0 drill_files   J  WY����    S  ]^��  ��    l cc����     parse name    �    p a r s e   n a m e  r  cs c  co  n  ck!"! 4  fk��#
�� 
cobj# m  ij���� " o  cf���� 0 drill_files    m  kn��
�� 
TEXT o      ���� 0 
drill_file   $%$ r  t�&'& n  t�()( 7 w���*+
�� 
ctxt* m  }���� + m  ������ ) o  tw���� 0 
drill_file  ' o      ���� 
0 prefix  % ,-, r  ��./. n  ��010 7 ����23
�� 
ctxt2 m  ������ 3 l ��4����4 \  ��565 l ��7����7 n  ��898 1  ����
�� 
leng9 o  ������ 0 
drill_file  ��  ��  6 m  ������ ��  ��  1 o  ������ 0 
drill_file  / o      ���� 0 cam  - :;: r  ��<=< n  ��>?> 7 ����@A
�� 
ctxt@ l ��B����B \  ��CDC l ��E����E n  ��FGF 1  ����
�� 
lengG o  ������ 0 
drill_file  ��  ��  D m  ������ ��  ��  A l ��H����H \  ��IJI l ��K����K n  ��LML 1  ����
�� 
lengM o  ������ 0 
drill_file  ��  ��  J m  ������ ��  ��  ? o  ������ 0 
drill_file  = o      ���� 0 	iteration  ; NON r  ��PQP b  ��RSR b  ��TUT b  ��VWV b  ��XYX o  ������ 
0 prefix  Y m  ��ZZ �[[  _W o  ������ 0 cam  U m  ��\\ �]]  _S o  ������ 0 	iteration  Q o      ���� 0 basename  O ^_^ r  ��`a` b  ��bcb b  ��ded b  ��fgf o  ������ 0 
local_base  g m  ��hh �ii  r a r :e o  ������ 0 basename  c m  ��jj �kk  . r a ra o      ���� 0 lrarfile  _ lml l  ����no��  n � � if prefix < 200 then -- see which RAID to use - all going to RAID2 requested by Lindy on July 15, 2013		set remote_base to raid1_base	else		set remote_base to raid2_base	end if    o �ppl   i f   p r e f i x   <   2 0 0   t h e n   - -   s e e   w h i c h   R A I D   t o   u s e   -   a l l   g o i n g   t o   R A I D 2   r e q u e s t e d   b y   L i n d y   o n   J u l y   1 5 ,   2 0 1 3  	 	 s e t   r e m o t e _ b a s e   t o   r a i d 1 _ b a s e  	 e l s e  	 	 s e t   r e m o t e _ b a s e   t o   r a i d 2 _ b a s e  	 e n d   i f  m qrq r  �sts o  ������ 0 storage_base  t o      ���� 0 remote_base  r uvu l ��������  ��  ��  v wxw Z yz����y =  {|{ o  ���� 
0 prefix  | m  
}} �~~  z r  � m  �� ���  0 0 0� o      ���� 
0 prefix  ��  ��  x ��� r  %��� b  !��� o  ���� 
0 prefix  � m   �� ���  _� o      ���� 
0 prefix  � ��� O  &(��� k  ,'�� ��� r  ,7��� b  ,3��� o  ,/���� 0 remote_base  � m  /2�� ��� 
 g o o d :� o      ���� 0 
folder_add  � ��� Z 8j������� H  8E�� l 8D������ I 8D�����
�� .coredoexbool        obj � 4  8@���
�� 
cfol� o  <?���� 0 
folder_add  ��  ��  ��  � I Hf�����
�� .corecrel****      � null��  � ����
�� 
kocl� m  LO��
�� 
cfol� ����
�� 
insh� o  RU���� 0 remote_base  � �����
�� 
prdt� K  X`�� �����
�� 
pnam� m  [^�� ���  g o o d��  ��  ��  ��  � ��� r  kv��� b  kr��� o  kn���� 0 remote_base  � m  nq�� ���  m p 4 :� o      ���� 0 
folder_add  � ��� Z w�������� H  w��� l w������� I w������
�� .coredoexbool        obj � 4  w���
�� 
cfol� o  {~���� 0 
folder_add  ��  ��  ��  � I ������
�� .corecrel****      � null�  � �~��
�~ 
kocl� m  ���}
�} 
cfol� �|��
�| 
insh� o  ���{�{ 0 remote_base  � �z��y
�z 
prdt� K  ���� �x��w
�x 
pnam� m  ���� ���  m p 4�w  �y  ��  ��  � ��� r  ����� b  ����� o  ���v�v 0 remote_base  � m  ���� ���  P r o R e s :� o      �u�u 0 
folder_add  � ��� Z �����t�s� H  ���� l ����r�q� I ���p��o
�p .coredoexbool        obj � 4  ���n�
�n 
cfol� o  ���m�m 0 
folder_add  �o  �r  �q  � I ���l�k�
�l .corecrel****      � null�k  � �j��
�j 
kocl� m  ���i
�i 
cfol� �h��
�h 
insh� o  ���g�g 0 remote_base  � �f��e
�f 
prdt� K  ���� �d��c
�d 
pnam� m  ���� ���  P r o R e s�c  �e  �t  �s  � ��� r  ����� b  ����� o  ���b�b 0 remote_base  � m  ���� ���  b a d r a r :� o      �a�a 0 
folder_add  � ��`� Z �'���_�^� H  ��� l ���]�\� I ��[��Z
�[ .coredoexbool        obj � 4  ���Y�
�Y 
cfol� o  ���X�X 0 
folder_add  �Z  �]  �\  � I #�W�V�
�W .corecrel****      � null�V  � �U��
�U 
kocl� m  	�T
�T 
cfol� �S��
�S 
insh� o  �R�R 0 remote_base  � �Q��P
�Q 
prdt� K  �� �O��N
�O 
pnam� m  �� ���  b a d r a r�N  �P  �_  �^  �`  � m  &)���                                                                                  MACS  alis    t  Macintosh HD               ��%H+   z��
Finder.app                                                      }�хx�        ����  	                CoreServices    ���u      х�7     z�� z�� z��  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  � ��� l ))�M�L�K�M  �L  �K  � ��� r  )4��� b  )0��� o  ),�J�J 0 
local_base  � m  ,/   �  c a c h e :� o      �I�I 0 lcache_folder  �  l 55�H�G�F�H  �G  �F    O  5� k  ;� 	
	 r  ;F b  ;B o  ;>�E�E 0 remote_base   m  >A � 
 g o o d : o      �D�D 0 
goodfolder  
  r  GR b  GN o  GJ�C�C 0 
goodfolder   o  JM�B�B 0 date_folder   o      �A�A 0 
folder_add    Z S��@�? H  S` l S_�>�= I S_�<�;
�< .coredoexbool        obj  4  S[�:
�: 
cfol o  WZ�9�9 0 
folder_add  �;  �>  �=   I c��8�7
�8 .corecrel****      � null�7   �6 !
�6 
kocl  m  gj�5
�5 
cfol! �4"#
�4 
insh" o  mp�3�3 0 
goodfolder  # �2$�1
�2 
prdt$ K  s{%% �0&�/
�0 
pnam& o  vy�.�. 0 date_folder  �/  �1  �@  �?   '�-' r  ��()( b  ��*+* o  ���,�, 0 
goodfolder  + o  ���+�+ 0 date_folder  ) o      �*�* 0 
goodfolder  �-   m  58,,�                                                                                  MACS  alis    t  Macintosh HD               ��%H+   z��
Finder.app                                                      }�хx�        ����  	                CoreServices    ���u      х�7     z�� z�� z��  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��   -.- l ���)�(�'�)  �(  �'  . /0/ l ���&�%�$�&  �%  �$  0 121 l ���#�"�!�#  �"  �!  2 343 r  ��565 b  ��787 b  ��9:9 b  ��;<; o  ��� �  0 posix_local_base  < m  ��== �>>  c a c h e /: o  ���� 0 basename  8 m  ��?? �@@  /6 o      �� 0 posix_ldpxfolder  4 ABA r  ��CDC b  ��EFE b  ��GHG o  ���� 0 lcache_folder  H o  ���� 0 basename  F m  ��II �JJ  :D o      �� 0 
ldpxfolder  B KLK l ������  �  �  L MNM l ������  �  �  N OPO r  ��QRQ b  ��STS o  ���� 0 
local_base  T m  ��UU �VV  a j a :R o      �� 0 
lajafolder 
lajaFolderP WXW l ������  �  �  X YZY l ���[\�  [ . ( there are two tests we need to perform:   \ �]] P   t h e r e   a r e   t w o   t e s t s   w e   n e e d   t o   p e r f o r m :Z ^_^ l ���`a�  ` 0 * 1) test and extract DPX from the RAR file   a �bb T   1 )   t e s t   a n d   e x t r a c t   D P X   f r o m   t h e   R A R   f i l e_ cdc O  �efe l �ghig k  �jj klk r  ��mnm b  ��opo o  ���� 0 
local_base  p m  ��qq �rr  c a c h e :n o      �� 0 
folder_add  l sts l ����
�	�  �
  �	  t u�u Z  �vw�xv I ���y�
� .coredoexbool        obj y 4  ���z
� 
cfolz o  ���� 0 
folder_add  �  w I ���{�
� .coredeloobj        obj { 4  ��� |
�  
cfol| o  ������ 0 
folder_add  �  �  x I �����}
�� .corecrel****      � null��  } ��~
�� 
kocl~ m  ����
�� 
cfol ����
�� 
insh� o  � ���� 0 
local_base  � �����
�� 
prdt� K  �� �����
�� 
pnam� m  	�� ��� 
 c a c h e��  ��  �  h   clean up cache   i ���    c l e a n   u p   c a c h ef m  �����                                                                                  MACS  alis    t  Macintosh HD               ��%H+   z��
Finder.app                                                      }�хx�        ����  	                CoreServices    ���u      х�7     z�� z�� z��  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  d ��� l ��������  ��  ��  � ��� Q  ����� k  ��� ��� l ������  � C = set corename to text 5 thru (length of basename) of basename   � ��� z   s e t   c o r e n a m e   t o   t e x t   5   t h r u   ( l e n g t h   o f   b a s e n a m e )   o f   b a s e n a m e� ��� r  )��� b  %��� b  !��� b  ��� o  ���� 0 
ldpxfolder  � o  ���� 
0 prefix  � o   ���� 0 cam  � m  !$�� ���  . 0 0 0 1 . d p x� o      ���� 0 ldpxfile lDPXFile� ��� l **��������  ��  ��  � ��� l *E���� I *E�����
�� .sysoexecTEXT���     TEXT� b  *A��� b  *=��� b  *9��� b  *5��� b  *1��� m  *-�� ��� 6 / u s r / l o c a l / b i n / r a r / u n r a r   e  � o  -0���� 0 posix_local_base  � m  14�� ���  r a r /� o  58���� 0 basename  � m  9<�� ��� 
 . r a r  � o  =@���� 0 posix_ldpxfolder  ��  � ) # make sure the the RAR file is good   � ��� F   m a k e   s u r e   t h e   t h e   R A R   f i l e   i s   g o o d� ��� r  FK��� m  FG��
�� boovfals� o      ���� 0 	rar_error  � ��� Q  L����� k  O^�� ��� l OX���� 4  OX���
�� 
alis� o  SV���� 0 ldpxfile lDPXFile� E ? 2) if the RAR file is good, make sure the naming is correct			   � ��� ~   2 )   i f   t h e   R A R   f i l e   i s   g o o d ,   m a k e   s u r e   t h e   n a m i n g   i s   c o r r e c t 	 	 	� ���� r  Y^��� m  YZ��
�� boovfals� o      ���� 0 	rar_error  ��  � R      ������
�� .ascrerr ****      � ****��  ��  � k  f��� ��� r  fk��� m  fg��
�� boovtrue� o      ���� 0 	rar_error  � ��� r  l{��� b  lw��� b  ls��� m  lo�� ��� ThchHTNkcxn0N��g	[P�De�Y9^v�{Ou(   # # # _ c a m # # # _ # # . # # # # . d p x0� o  or��
�� 
ret � m  sv�� ��� � n a m e d   i n c o r r e c t l y .   T h e   R A R   f i l e   s h o u l d   n o t   i n c l u d e   f o l d e r   a n d   d p x   f r a m e s   s h o u l d   b e   n a m e d   # # # _ c a m # # # _ # # . # # # # . d p x� o      ���� 0 	error_msg  � ���� r  |���� [  |��� o  |}���� 0 bname_counter  � m  }~���� � o      ���� 0 bname_counter  ��  � ���� l ����������  ��  ��  ��  � R      ������
�� .ascrerr ****      � ****��  ��  � k  ���� ��� r  ����� m  ����
�� boovtrue� o      ���� 0 	rar_error  � ��� r  ����� b  ����� b  ����� m  ���� ��� f/Nqx0� o  ����
�� 
ret � m  ���� ���  a r e   c o r r u p t .� o      ���� 0 	error_msg  � ���� r  ����� [  ����� o  ������ 0 btrans_counter  � m  ������ � o      ���� 0 btrans_counter  ��  � ��� l ����������  ��  ��  � ��� l ���� ��       converstion to AJA format    � 4   c o n v e r s t i o n   t o   A J A   f o r m a t� �� Z  ���� H  �� l ������ o  ������ 0 	rar_error  ��  ��   k  �j		 

 l ������   � { now that we know the RAR file is good and dpx frames have been extracted, we will need to inject iteration to the dpx name    � �   n o w   t h a t   w e   k n o w   t h e   R A R   f i l e   i s   g o o d   a n d   d p x   f r a m e s   h a v e   b e e n   e x t r a c t e d ,   w e   w i l l   n e e d   t o   i n j e c t   i t e r a t i o n   t o   t h e   d p x   n a m e  r  �� b  �� o  ������ 0 lcache_folder   o  ������ 0 basename   o      ���� 0 lcache_folder    O �� r  �� n  �� 1  ����
�� 
pnam n  �� 2 ����
�� 
file 4  ����
�� 
cfol o  ������ 0 lcache_folder   o      ���� 0 drill_files   m  ��  �                                                                                  MACS  alis    t  Macintosh HD               ��%H+   z��
Finder.app                                                      }�хx�        ����  	                CoreServices    ���u      х�7     z�� z�� z��  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��   !"! l ����������  ��  ��  " #$# Z  �	s%&����% > ��'(' o  ������ 0 drill_files  ( J  ������  & X  �	o)��*) k  �	j++ ,-, l ����������  ��  ��  - ./. r  ��010 n  ��232 1  ����
�� 
leng3 o  ������ 0 
drill_file  1 o      ���� 0 name_length  / 454 r  �	676 n  �	898 7 	 	��:;
�� 
ctxt: l 		<����< \  		=>= o  		
���� 0 name_length  > m  	
	���� ��  ��  ; o  		���� 0 name_length  9 o  �	 ���� 0 
drill_file  7 o      ���� 0 name_extension  5 ?��? Z  		j@A����@ = 		BCB o  		���� 0 name_extension  C m  		DD �EE  . d p xA l 	!	fFGHF k  	!	fII JKJ l 	!	!��������  ��  ��  K LML r  	!	.NON b  	!	*PQP b  	!	(RSR o  	!	$���� 0 lcache_folder  S m  	$	'TT �UU  :Q o  	(	)���� 0 
drill_file  O o      ���� 0 original_name  M VWV r  	/	LXYX b  	/	HZ[Z o  	/	2���� 0 basename  [ n  	2	G\]\ 7 	3	G��^_
�� 
ctxt^ l 	9	A`����` \  	9	Aaba o  	:	=���� 0 name_length  b m  	=	@���� ��  ��  _ o  	B	F���� 0 name_length  ] o  	2	3���� 0 
drill_file  Y o      ���� 0 new_name  W cdc O 	M	defe r  	S	cghg o  	S	V���� 0 new_name  h l     i����i n      jkj 1  	^	b��
�� 
pnamk 4  	V	^��l
�� 
filel o  	Z	]���� 0 original_name  ��  ��  f m  	M	Pmm�                                                                                  MACS  alis    t  Macintosh HD               ��%H+   z��
Finder.app                                                      }�хx�        ����  	                CoreServices    ���u      х�7     z�� z�� z��  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  d n��n l 	e	e�������  ��  �  ��  G * $ if it's not a DPX file then skip it   H �oo H   i f   i t ' s   n o t   a   D P X   f i l e   t h e n   s k i p   i t��  ��  ��  �� 0 
drill_file  * o  ���~�~ 0 drill_files  ��  ��  $ pqp r  	t	�rsr b  	t	�tut b  	t	vwv b  	t	{xyx o  	t	w�}�} 0 lcache_folder  y m  	w	zzz �{{  :w o  	{	~�|�| 0 basename  u m  		�|| �}}  . 0 0 0 1 . d p xs o      �{�{ 0 ldpxfile lDPXFileq ~~ l 	�	��z�y�x�z  �y  �x   ��� l 	�	��w���w  � � � the conversion can not be directly after the good RAR confirmation because when there is a long sequence it will trigger a timeout, which will cause the RAR file to become falsely identified as a bad RAR   � ����   t h e   c o n v e r s i o n   c a n   n o t   b e   d i r e c t l y   a f t e r   t h e   g o o d   R A R   c o n f i r m a t i o n   b e c a u s e   w h e n   t h e r e   i s   a   l o n g   s e q u e n c e   i t   w i l l   t r i g g e r   a   t i m e o u t ,   w h i c h   w i l l   c a u s e   t h e   R A R   f i l e   t o   b e c o m e   f a l s e l y   i d e n t i f i e d   a s   a   b a d   R A R� ��� O  	�
���� k  	�
��� ��� I 	�	��v�u�t
�v .miscactvnull��� ��� null�u  �t  � ��� I 	�	��s��r
�s .sysodelanull��� ��� nmbr� m  	�	��q�q �r  � ��� I 	�	��p��o
�p .aevtodocnull  �    alis� o  	�	��n�n 0 ldpxfile lDPXFile�o  � ��� l 	�	��m�l�k�m  �l  �k  � ��� O  	�	���� k  	�	��� ��� I 	�	��j��
�j .prcskprsnull���     ctxt� m  	�	��� ���  s� �i��h
�i 
faal� J  	�	��� ��� m  	�	��g
�g eMdsKcmd� ��f� m  	�	��e
�e eMdsKsft�f  �h  � ��d� I 	�	��c��b
�c .prcskprsnull���     ctxt� o  	�	��a
�a 
ret �b  �d  � m  	�	����                                                                                  sevs  alis    �  Macintosh HD               ��%H+   z��System Events.app                                               ~N��t�v        ����  	                CoreServices    ���u      �t��     z�� z�� z��  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � ��� I 	�	��`��_
�` .sysodelanull��� ��� nmbr� m  	�	��^�^ �_  � ��� O  	�
{��� k  	�
z�� ��� T  	�
O�� k  	�
J�� ��� Q  	�
	���� k  	�	��� ��� r  	�	���� n  	�	���� 1  	�	��]
�] 
ptsz� 4  	�	��\�
�\ 
file� l 	�	���[�Z� b  	�	���� b  	�	���� o  	�	��Y�Y 0 
ldpxfolder  � o  	�	��X�X 0 basename  � m  	�	��� ���  . m o v�[  �Z  � o      �W�W 0 	firstlook  � ��V� I 	�	��U��T
�U .sysodelanull��� ��� nmbr� m  	�	��S�S �T  �V  � R      �R�Q�P
�R .ascrerr ****      � ****�Q  �P  � r  

	��� m  

�O�O  � o      �N�N 0 	firstlook  � ��� Q  


:���� k  

-�� ��� r  

%��� n  

!��� 1  

!�M
�M 
ptsz� 4  

�L�
�L 
file� l 

��K�J� b  

��� b  

��� o  

�I�I 0 
ldpxfolder  � o  

�H�H 0 basename  � m  

�� ���  . m o v�K  �J  � o      �G�G 0 
secondlook  � ��F� I 
&
-�E��D
�E .sysodelanull��� ��� nmbr� m  
&
)�C�C �D  �F  � R      �B�A�@
�B .ascrerr ****      � ****�A  �@  � r  
5
:��� m  
5
6�?�? � o      �>�> 0 
secondlook  � ��=� Z 
;
J���<�;� =  
;
B��� o  
;
>�:�: 0 	firstlook  � o  
>
A�9�9 0 
secondlook  �  S  
E
F�<  �;  �=  � ��� l 
P
P�8�7�6�8  �7  �6  � ��� I 
P
r�5��
�5 .coremoveobj        obj � 4  
P
`�4�
�4 
file� l 
T
_��3�2� b  
T
_��� b  
T
[��� o  
T
W�1�1 0 
ldpxfolder  � o  
W
Z�0�0 0 basename  � m  
[
^�� ���  . m o v�3  �2  � �/��
�/ 
insh� o  
c
f�.�. 0 
aja_folder  � �-��,
�- 
alrp� m  
i
l�+
�+ savoyes �,  � ��*� I 
s
z�)��(
�) .sysodelanull��� ��� nmbr� m  
s
v�'�' �(  �*  � m  	�	����                                                                                  MACS  alis    t  Macintosh HD               ��%H+   z��
Finder.app                                                      }�хx�        ����  	                CoreServices    ���u      х�7     z�� z�� z��  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  � ��� l 
|
|�&�%�$�&  �%  �$  � ��� I 
|
��#�"�!
�# .miscactvnull��� ��� null�"  �!  �    O  
�
� I 
�
�� 
�  .prcskprsnull���     ctxt m  
�
� �  w ��
� 
faal J  
�
�		 
�
 m  
�
��
� eMdsKcmd�  �   m  
�
��                                                                                  sevs  alis    �  Macintosh HD               ��%H+   z��System Events.app                                               ~N��t�v        ����  	                CoreServices    ���u      �t��     z�� z�� z��  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��   � l 
�
�����  �  �  �  � m  	�	��                                                                                  AjDP  alis    �  Macintosh HD               ��%H+   z��AJA DPXToQTTranslator.app                                       3�:�<��        ����  	                Applications    ���u      �<�
     z��  4Macintosh HD:Applications: AJA DPXToQTTranslator.app  4  A J A   D P X T o Q T T r a n s l a t o r . a p p    M a c i n t o s h   H D  &Applications/AJA DPXToQTTranslator.app  / ��  �  l 
�
�����  �  �    l 
�
���    	clean up	    �  c l e a n   u p 	  O  
�
� k  
�
�  r  
�
� b  
�
� o  
�
��� 0 remote_base   m  
�
�   �!! 
 g o o d : o      �� 0 
goodfolder   "#" r  
�
�$%$ b  
�
�&'& o  
�
��� 0 
goodfolder  ' o  
�
��� 0 date_folder  % o      �� 0 
folder_add  # ()( Z 
�
�*+��* H  
�
�,, l 
�
�-��- I 
�
��
.�	
�
 .coredoexbool        obj . 4  
�
��/
� 
cfol/ o  
�
��� 0 
folder_add  �	  �  �  + I 
�
���0
� .corecrel****      � null�  0 �12
� 
kocl1 m  
�
��
� 
cfol2 �34
� 
insh3 o  
�
��� 0 
goodfolder  4 � 5��
�  
prdt5 K  
�
�66 ��7��
�� 
pnam7 o  
�
����� 0 date_folder  ��  ��  �  �  ) 8��8 r  
�
�9:9 b  
�
�;<; o  
�
����� 0 
goodfolder  < o  
�
����� 0 date_folder  : o      ���� 0 
goodfolder  ��   m  
�
�==�                                                                                  MACS  alis    t  Macintosh HD               ��%H+   z��
Finder.app                                                      }�хx�        ����  	                CoreServices    ���u      х�7     z�� z�� z��  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��   >?> l 
�
���������  ��  ��  ? @A@ O  
�SBCB l  RDEFD k   RGG HIH t   PJKJ k  OLL MNM l OPQO I ��RS
�� .coremoveobj        obj R o  ���� 0 lrarfile  S ��TU
�� 
inshT 4  
��V
�� 
cfolV o  ���� 0 
goodfolder  U ��W��
�� 
alrpW m  ��
�� boovtrue��  P   move RAR file   Q �XX    m o v e   R A R   f i l eN YZY I $��[��
�� .coredeloobj        obj [ o   ���� 0 lrarfile  ��  Z \]\ l %%��������  ��  ��  ] ^_^ l %B`ab` I %B��cd
�� .coremoveobj        obj c 4  %-��e
�� 
cfole o  ),���� 0 lcache_folder  d ��fg
�� 
inshf 4  08��h
�� 
cfolh o  47���� 0 
goodfolder  g ��i��
�� 
alrpi m  ;<��
�� boovtrue��  a   move DPX frames   b �jj     m o v e   D P X   f r a m e s_ k��k I CO��l��
�� .coredeloobj        obj l 4  CK��m
�� 
cfolm o  GJ���� 0 lcache_folder  ��  ��  K m   �����I n��n l QQ��������  ��  ��  ��  E ; 5 move good RAR, DPX, ProRes, mp4 from cache to pickup   F �oo j   m o v e   g o o d   R A R ,   D P X ,   P r o R e s ,   m p 4   f r o m   c a c h e   t o   p i c k u pC m  
�
�pp�                                                                                  MACS  alis    t  Macintosh HD               ��%H+   z��
Finder.app                                                      }�хx�        ����  	                CoreServices    ���u      х�7     z�� z�� z��  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  A qrq s  Tdsts b  T_uvu b  T[wxw 1  TW��
�� 
tab x o  WZ���� 0 basename  v o  [^��
�� 
ret t l     y����y n      z{z  ;  bc{ o  _b���� 0 	good_list  ��  ��  r |��| r  ej}~} [  eh� o  ef���� 0 good_counter  � m  fg���� ~ o      ���� 0 good_counter  ��  ��   k  m��� ��� l mm������  � a [ if there was problems move the bad RAR file to the badrar folder and send out notification   � ��� �   i f   t h e r e   w a s   p r o b l e m s   m o v e   t h e   b a d   R A R   f i l e   t o   t h e   b a d r a r   f o l d e r   a n d   s e n d   o u t   n o t i f i c a t i o n� ��� r  mx��� b  mt��� o  mp���� 0 remote_base  � m  ps�� ���  b a d r a r :� o      ���� 0 badrarfolder  � ��� O  y���� k  ��� ��� r  ���� b  ���� o  ����� 0 badrarfolder  � o  ������ 0 date_folder  � o      ���� 0 
folder_add  � ���� Z ��������� H  ���� l �������� I �������
�� .coredoexbool        obj � 4  �����
�� 
cfol� o  ������ 0 
folder_add  ��  ��  ��  � I �������
�� .corecrel****      � null��  � ����
�� 
kocl� m  ����
�� 
cfol� ����
�� 
insh� o  ������ 0 badrarfolder  � �����
�� 
prdt� K  ���� �����
�� 
pnam� o  ������ 0 date_folder  ��  ��  ��  ��  ��  � m  y|���                                                                                  MACS  alis    t  Macintosh HD               ��%H+   z��
Finder.app                                                      }�хx�        ����  	                CoreServices    ���u      х�7     z�� z�� z��  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  � ��� r  ����� b  ����� o  ������ 0 badrarfolder  � o  ������ 0 date_folder  � o      ���� 0 badrarfolder  � ��� O  ���� k  ��� ��� t  ����� I ������
�� .coremoveobj        obj � o  ������ 0 lrarfile  � ����
�� 
insh� 4  �����
�� 
cfol� o  ������ 0 badrarfolder  � �����
�� 
alrp� m  ����
�� boovtrue��  � m  ������X� ��� I �������
�� .coredeloobj        obj � o  ������ 0 lrarfile  ��  � ���� Z �������� I ������
�� .coredoexbool        obj � 4  �����
�� 
cfol� o  ������ 0 
ldpxfolder  ��  � I �����
�� .coredeloobj        obj � 4  ���
�� 
cfol� o  
���� 0 
ldpxfolder  ��  ��  ��  ��  � m  �����                                                                                  MACS  alis    t  Macintosh HD               ��%H+   z��
Finder.app                                                      }�хx�        ����  	                CoreServices    ���u      х�7     z�� z�� z��  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  � ��� l ��������  ��  ��  � ��� l ������  � 4 . send notification if bad RAR file is detected   � ��� \   s e n d   n o t i f i c a t i o n   i f   b a d   R A R   f i l e   i s   d e t e c t e d� ���� O  ���� k  ��� ��� r  ���� I ������
�� .corecrel****      � null��  � ����
�� 
kocl� m  "%��
�� 
bcke� �����
�� 
prdt� K  (��� ����
�� 
pvis� m  +,��
�� boovtrue� ����
�� 
subj� b  /6��� m  /2�� ��� D S u p e r B o o k   B a d   R A R   F i l e   D e t e c t e d   -  � o  25���� 0 date_folder  � �����
�� 
ctnt� b  9���� b  9���� b  9���� b  9|��� b  9x��� b  9t��� b  9p��� b  9l��� b  9h��� b  9d��� b  9`��� b  9\��� b  9X� � b  9T b  9P b  9L b  9H b  9D	
	 b  9@ m  9< � N�r1v�k�e�V� , o  <?��
�� 
ret 
 m  @C � & D e a r   D a y s v i e w   T e a m : o  DG��
�� 
ret  o  HK��
�� 
ret  o  LO���� 0 basename   m  PS � 
 . r a r    o  TW���� 0 	error_msg  � o  X[�
� 
ret � o  \_�~
�~ 
ret � m  `c � ��h�g�hchH�q6T��e�Sѐ .� o  dg�}
�} 
ret � m  hk � : P l e a s e   c h e c k   f i l e   a n d   r e s e n d .� o  lo�|
�| 
ret � o  ps�{
�{ 
ret � m  tw � �"�" ,� o  x{�z
�z 
ret � m  | �    T h a n k s ,� o  ���y
�y 
ret � m  �� � 
 G i z m o��  ��  � o      �x�x 0 
status_msg  �  O  ��  I ���w�v!
�w .corecrel****      � null�v  ! �u"#
�u 
kocl" m  ���t
�t 
trcp# �s$%
�s 
insh$ n  ��&'&  ;  ��' 2 ���r
�r 
trcp% �q(�p
�q 
prdt( K  ��)) �o*�n
�o 
pnam* o  ���m�m 0 
notify_bad  �n  �p    o  ���l�l 0 
status_msg   +�k+ I ���j,�i
�j .emsgsendnull���     bcke, o  ���h�h 0 
status_msg  �i  �k  � m  --�                                                                                  emal  alis    F  Macintosh HD               ��%H+   z��Mail.app                                                        {wяر        ����  	                Applications    ���u      ѐ�     z��  #Macintosh HD:Applications: Mail.app     M a i l . a p p    M a c i n t o s h   H D  Applications/Mail.app   / ��  ��  ��  ��  ��    ./. l     �g�f�e�g  �f  �e  / 010 l     �d23�d  2 4 . move files to Adobe Media Encoder watchfolder   3 �44 \   m o v e   f i l e s   t o   A d o b e   M e d i a   E n c o d e r   w a t c h f o l d e r1 565 l ��7�c�b7 O ��898 r  ��:;: n  ��<=< 1  ���a
�a 
pnam= n  ��>?> 2 ���`
�` 
file? 4  ���_@
�_ 
cfol@ o  ���^�^ 0 
aja_folder  ; o      �]�] 0 drill_files  9 m  ��AA�                                                                                  MACS  alis    t  Macintosh HD               ��%H+   z��
Finder.app                                                      }�хx�        ����  	                CoreServices    ���u      х�7     z�� z�� z��  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  �c  �b  6 BCB l �8D�\�[D Z  �8EF�Z�YE > ��GHG o  ���X�X 0 drill_files  H J  ���W�W  F X  �4I�VJI O 	/KLK I .�UMN
�U .coremoveobj        obj M 4  �TO
�T 
fileO l P�S�RP b  QRQ o  �Q�Q 0 
aja_folder  R o  �P�P 0 
drill_file  �S  �R  N �OST
�O 
inshS 4  $�NU
�N 
cfolU o   #�M�M 0 ame_base  T �LV�K
�L 
alrpV m  '(�J
�J boovtrue�K  L m  	WW�                                                                                  MACS  alis    t  Macintosh HD               ��%H+   z��
Finder.app                                                      }�хx�        ����  	                CoreServices    ���u      х�7     z�� z�� z��  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  �V 0 
drill_file  J o  ���I�I 0 drill_files  �Z  �Y  �\  �[  C XYX l     �H�G�F�H  �G  �F  Y Z[Z l     �E\]�E  \ ) # give it some time for AME to start   ] �^^ F   g i v e   i t   s o m e   t i m e   f o r   A M E   t o   s t a r t[ _`_ l 9@a�D�Ca I 9@�Bb�A
�B .sysodelanull��� ��� nmbrb m  9<�@�@ <�A  �D  �C  ` cdc l     �?�>�=�?  �>  �=  d efe l     �<gh�<  g t n find prefix and extension of file then determine if needs to be fixed then fix it then move it� if not ignore   h �ii �   f i n d   p r e f i x   a n d   e x t e n s i o n   o f   f i l e   t h e n   d e t e r m i n e   i f   n e e d s   t o   b e   f i x e d   t h e n   f i x   i t   t h e n   m o v e   i t &   i f   n o t   i g n o r ef jkj l Al�;�:l T  Amm k  Fnn opo l FF�9qr�9  q !  wait until AME is not busy   r �ss 6   w a i t   u n t i l   A M E   i s   n o t   b u s yp tut T  F�vv O  K}wxw k  Q|yy z{z l QQ�8|}�8  | > 8 set pid to unix id of process "Adobe Media Encoder CS6"   } �~~ p   s e t   p i d   t o   u n i x   i d   o f   p r o c e s s   " A d o b e   M e d i a   E n c o d e r   C S 6 "{ � r  Qd��� l Q`��7�6� I Q`�5��4
�5 .sysoexecTEXT���     TEXT� b  Q\��� b  QX��� m  QT�� ��� V / b i n / p s   - x c o   % c p u , c o m m a n d   |   / u s r / b i n / a w k   ' /� m  TW�� ��� . A d o b e   M e d i a   E n c o d e r   C S 6� m  X[�� ���  $ /   { p r i n t   $ 1 } '�4  �7  �6  � o      �3�3 0 	cpu_usage  � ��� l ee�2���2  �   display dialog cpu_usage   � ��� 2   d i s p l a y   d i a l o g   c p u _ u s a g e� ��� Z et���1�0� A  el��� o  eh�/�/ 0 	cpu_usage  � m  hk�� ?��������  S  op�1  �0  � ��.� I u|�-��,
�- .sysodelanull��� ��� nmbr� m  ux�+�+ �,  �.  x m  KN���                                                                                  sevs  alis    �  Macintosh HD               ��%H+   z��System Events.app                                               ~N��t�v        ����  	                CoreServices    ���u      �t��     z�� z�� z��  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  u ��� l ���*�)�(�*  �)  �(  � ��� l ������ I ���'��&
�' .sysodelanull��� ��� nmbr� m  ���%�% �&  � 5 / give it some time to finish releasing the file   � ��� ^   g i v e   i t   s o m e   t i m e   t o   f i n i s h   r e l e a s i n g   t h e   f i l e� ��� l ���$�#�"�$  �#  �"  � ��� O ����� r  ����� n  ����� 1  ���!
�! 
pnam� n  ����� 2 ��� 
�  
file� 4  ����
� 
cfol� o  ���� 0 
ame_output  � o      �� 0 drill_files  � m  �����                                                                                  MACS  alis    t  Macintosh HD               ��%H+   z��
Finder.app                                                      }�хx�        ����  	                CoreServices    ���u      х�7     z�� z�� z��  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  � ��� Z  ������ = ����� o  ���� 0 drill_files  � J  ����  �  S  ���  � X  ����� k  �	�� ��� r  ����� m  ���
� boovtrue� o      �� 0 skip  � ��� r  ����� m  ���� ���  � o      �� 
0 suffix  � ��� l ������  �  �  � ��� l ������  �   parse file name   � ���     p a r s e   f i l e   n a m e� ��� r  ����� n  ����� 1  ���
� 
leng� o  ���� 0 
drill_file  � o      �� 0 name_length  � ��� r  ����� n  ����� 7 �����
� 
ctxt� l ������ \  ����� o  ���
�
 0 name_length  � m  ���	�	 �  �  � o  ���� 0 name_length  � o  ���� 0 
drill_file  � o      �� 0 name_extension  � ��� r  ���� n  ���� 7 ����
� 
ctxt� m  �� � m  �� � o  ���� 0 
drill_file  � o      �� 
0 prefix  � ��� r  1��� n  -��� 7 -� ��
�  
ctxt� m  ���� � l ,������ \  ,��� l *������ I *�����
�� .sysooffslong    ��� null��  � ����
�� 
psof� o   ���� 0 name_extension  � �����
�� 
psin� o  #$���� 0 
drill_file  ��  ��  ��  � m  *+���� ��  ��  � o  ���� 0 
drill_file  � o      ���� 0 basename  � ��� l 22������  � � z display dialog "file prefix: " & prefix & return & "basename: " & basename & return & "file extension: " & name_extension   � ��� �   d i s p l a y   d i a l o g   " f i l e   p r e f i x :   "   &   p r e f i x   &   r e t u r n   &   " b a s e n a m e :   "   &   b a s e n a m e   &   r e t u r n   &   " f i l e   e x t e n s i o n :   "   &   n a m e _ e x t e n s i o n� ��� Z  2U�	 ����� =  29			 o  25���� 0 name_extension  	 m  58		 �		  . m o v	  k  <Q		 			 r  <C				 m  <?	
	
 �		  _ P r o R e s 4 4 4		 o      ���� 
0 suffix  	 			 r  DK			 m  DG		 �		  P r o R e s :	 o      ���� 0 destination  	 	��	 r  LQ			 m  LM��
�� boovfals	 o      ���� 0 skip  ��  ��  ��  � 			 Z  Vy		����	 =  V]			 o  VY���� 0 name_extension  	 m  Y\		 �		  . m p 4	 k  `u		 			 r  `g	 	!	  m  `c	"	" �	#	# 
 _ H 2 6 4	! o      ���� 
0 suffix  	 	$	%	$ r  ho	&	'	& m  hk	(	( �	)	)  m p 4 :	' o      ���� 0 destination  	% 	*��	* r  pu	+	,	+ m  pq��
�� boovfals	, o      ���� 0 skip  ��  ��  ��  	 	-	.	- l zz��������  ��  ��  	. 	/	0	/ l zz��	1	2��  	1 !  assemble desired file name   	2 �	3	3 6   a s s e m b l e   d e s i r e d   f i l e   n a m e	0 	4	5	4 r  z�	6	7	6 c  z�	8	9	8 J  z�	:	: 	;	<	; o  z}���� 
0 prefix  	< 	=	>	= o  }����� 0 basename  	> 	?	@	? o  ������ 
0 suffix  	@ 	A��	A o  ������ 0 name_extension  ��  	9 m  ����
�� 
TEXT	7 o      ���� 0 new_name  	5 	B	C	B l ����������  ��  ��  	C 	D	E	D l ����	F	G��  	F < 6 move the file if it's a mov or mp4 file, else skip it   	G �	H	H l   m o v e   t h e   f i l e   i f   i t ' s   a   m o v   o r   m p 4   f i l e ,   e l s e   s k i p   i t	E 	I	J	I Z  �	K	L����	K H  ��	M	M o  ������ 0 skip  	L k  �	N	N 	O	P	O l ����	Q	R��  	Q   display dialog new_name   	R �	S	S 0   d i s p l a y   d i a l o g   n e w _ n a m e	P 	T��	T O  �	U	V	U Q  �	W	X��	W t  ��	Y	Z	Y k  ��	[	[ 	\	]	\ r  ��	^	_	^ o  ������ 0 new_name  	_ l     	`����	` n      	a	b	a 1  ����
�� 
pnam	b 4  ����	c
�� 
file	c l ��	d����	d b  ��	e	f	e o  ������ 0 
ame_output  	f o  ������ 0 
drill_file  ��  ��  ��  ��  	] 	g	h	g l ����������  ��  ��  	h 	i	j	i I ����	k	l
�� .coremoveobj        obj 	k 4  ����	m
�� 
file	m l ��	n����	n b  ��	o	p	o o  ������ 0 
ame_output  	p o  ������ 0 new_name  ��  ��  	l ��	q	r
�� 
insh	q 4  ����	s
�� 
cfol	s l ��	t����	t b  ��	u	v	u b  ��	w	x	w b  ��	y	z	y o  ������ 0 remote_base  	z o  ������ 0 destination  	x o  ������ 0 date_folder  	v m  ��	{	{ �	|	|  :��  ��  	r ��	}��
�� 
alrp	} m  ����
�� boovtrue��  	j 	~��	~ I ����	��
�� .coredeloobj        obj 	 4  ����	�
�� 
file	� l ��	�����	� b  ��	�	�	� o  ������ 0 
ame_output  	� o  ������ 0 new_name  ��  ��  ��  ��  	Z m  ������X	X R      ������
�� .ascrerr ****      � ****��  ��  ��  	V m  ��	�	��                                                                                  MACS  alis    t  Macintosh HD               ��%H+   z��
Finder.app                                                      }�хx�        ����  	                CoreServices    ���u      х�7     z�� z�� z��  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  ��  ��  ��  	J 	���	� l ��������  ��  ��  ��  � 0 
drill_file  � o  ������ 0 drill_files  �  �;  �:  k 	�	�	� l     ��������  ��  ��  	� 	�	�	� l     ��	�	���  	�  y send summary notification� send one email per session rather than one email each conversion to cut down on email clutter   	� �	�	� �   s e n d   s u m m a r y   n o t i f i c a t i o n &   s e n d   o n e   e m a i l   p e r   s e s s i o n   r a t h e r   t h a n   o n e   e m a i l   e a c h   c o n v e r s i o n   t o   c u t   d o w n   o n   e m a i l   c l u t t e r	� 	�	�	� l 1	�����	� Z  1	�	���	�	� =  	�	�	� o  ���� 0 good_counter  	� m  ���� 	� r  !	�	�	� m  	�	� �	�	� � F i r s t   c a m   o f   t h e   d a y   i s   i n   q u e u e .   T h e   P r o R e s   a n d   P r e v i e w   v e r s i o n s   a r e   b e i n g   s e n t   t o   S u p e r b o o k   s t o r a g e :	� o      ���� 0 counter_translator  ��  	� r  $1	�	�	� b  $-	�	�	� b  $)	�	�	� m  $'	�	� �	�	� . T h e r e   a r e   n o w   t o t a l   o f  	� o  '(���� 0 good_counter  	� m  ),	�	� �	�	� �   c a m s   i n   q u e u e .   P r o R e s   a n d   P r e v i e w   v e r s i o n s   a r e   b e i n g   s e n t   t o   S u p e r b o o k   s t o r a g e .   S e e   t h e   l a t e s t   b e l o w :	� o      ���� 0 counter_translator  ��  ��  	� 	�	�	� l     ��������  ��  ��  	� 	�	�	� l 2�	�����	� Z  2�	�	�����	� ?  2;	�	�	� l 29	�����	� I 29��	���
�� .corecnte****       ****	� o  25���� 0 	good_list  ��  ��  ��  	� m  9:����  	� O  >�	�	�	� k  D�	�	� 	�	�	� r  D�	�	�	� I D�����	�
�� .corecrel****      � null��  	� ��	�	�
�� 
kocl	� m  HK��
�� 
bcke	� ��	��
�� 
prdt	� K  N�	�	� �~	�	�
�~ 
pvis	� m  QR�}
�} boovtrue	� �|	�	�
�| 
subj	� b  U\	�	�	� m  UX	�	� �	�	� N R E :   S u p e r B o o k   G o o d   R A R   F i l e   D e t e c t e d   -  	� o  X[�{�{ 0 date_folder  	� �z	��y
�z 
ctnt	� b  _�	�	�	� b  _�	�	�	� b  _�	�	�	� b  _~	�	�	� b  _z	�	�	� b  _v	�	�	� b  _r	�	�	� b  _n	�	�	� b  _j	�	�	� b  _f	�	�	� m  _b	�	� �	�	� ( D e a r   S u p e r B o o k   T e a m ,	� o  be�x
�x 
ret 	� o  fi�w
�w 
ret 	� o  jm�v�v 0 counter_translator  	� o  nq�u
�u 
ret 	� o  ru�t
�t 
ret 	� o  vy�s�s 0 	good_list  	� o  z}�r
�r 
ret 	� n  ~�	�	�	� 3  ���q
�q 
cobj	� o  ~��p�p 0 gizmoto  	� o  ���o
�o 
ret 	� m  ��	�	� �	�	� 
 G i z m o�y  �  	� o      �n�n 0 
status_msg  	� 	�	�	� O  ��	�	�	� I ���m�l	�
�m .corecrel****      � null�l  	� �k	�	�
�k 
kocl	� m  ���j
�j 
trcp	� �i	�	�
�i 
insh	� n  ��	�	�	�  ;  ��	� 2 ���h
�h 
trcp	� �g	��f
�g 
prdt	� K  ��	�	� �e	��d
�e 
pnam	� o  ���c�c 0 notify_good  �d  �f  	� o  ���b�b 0 
status_msg  	� 	��a	� I ���`	��_
�` .emsgsendnull���     bcke	� o  ���^�^ 0 
status_msg  �_  �a  	� m  >A	�	��                                                                                  emal  alis    F  Macintosh HD               ��%H+   z��Mail.app                                                        {wяر        ����  	                Applications    ���u      ѐ�     z��  #Macintosh HD:Applications: Mail.app     M a i l . a p p    M a c i n t o s h   H D  Applications/Mail.app   / ��  ��  ��  ��  ��  	� 	�	�	� l     �]�\�[�]  �\  �[  	� 	�	�	� l     �Z	�	��Z  	�   write out journal   	� �	�	� $   w r i t e   o u t   j o u r n a l	� 	�	�	� l ��	��Y�X	� r  ��	�	�	� I ���W	�	�
�W .rdwropenshor       file	� o  ���V�V 0 counter_file  	� �U	��T
�U 
perm	� m  ���S
�S boovtrue�T  	� o      �R�R $0 thefilereference theFileReference�Y  �X  	� 	�	�	� l ��	��Q�P	� I ���O
 

�O .rdwrseofnull���     ****
  o  ���N�N $0 thefilereference theFileReference
 �M
�L
�M 
set2
 m  ���K�K  �L  �Q  �P  	� 


 l �
�J�I
 I ��H


�H .rdwrwritnull���     ****
 l �
�G�F
 c  �
	


	 b  � 


 b  ��


 b  ��


 b  ��


 b  ��


 o  ���E�E 0 good_counter  
 o  ���D
�D 
ret 
 o  ���C�C 0 btrans_counter  
 o  ���B
�B 
ret 
 o  ���A�A 0 bname_counter  
 o  ���@
�@ 
ret 

 m   �?
�? 
TEXT�G  �F  
 �>


�> 
refn
 o  
�=�= $0 thefilereference theFileReference
 �<
�;
�< 
wrat
 m  �:
�: rdwreof �;  �J  �I  
 


 l 
�9�8
 I �7
�6
�7 .rdwrclosnull���     ****
 o  �5�5 $0 thefilereference theFileReference�6  �9  �8  
 


 l     �4�3�2�4  �3  �2  
 


 l     �1
 
!�1  
    clean up the trash   
! �
"
" &   c l e a n   u p   t h e   t r a s h
 
#
$
# l +
%�0�/
% O +
&
'
& I %*�.�-�,
�. .aevtquitnull��� ��� null�-  �,  
' m  "
(
(�                                                                                  AjDP  alis    �  Macintosh HD               ��%H+   z��AJA DPXToQTTranslator.app                                       3�:�<��        ����  	                Applications    ���u      �<�
     z��  4Macintosh HD:Applications: AJA DPXToQTTranslator.app  4  A J A   D P X T o Q T T r a n s l a t o r . a p p    M a c i n t o s h   H D  &Applications/AJA DPXToQTTranslator.app  / ��  �0  �/  
$ 
)
*
) l ,8
+�+�*
+ O ,8
,
-
, I 27�)�(�'
�) .aevtquitnull��� ��� null�(  �'  
- m  ,/
.
.L                                                                                  ame   alis    �  Macintosh HD               ��%H+   �G�Adobe Media Encoder CC 2014.app                                 �G�Ѱ�(        ����  	                Adobe Media Encoder CC 2014     ���u      Ѱ�h     �G� z��  WMacintosh HD:Applications: Adobe Media Encoder CC 2014: Adobe Media Encoder CC 2014.app   @  A d o b e   M e d i a   E n c o d e r   C C   2 0 1 4 . a p p    M a c i n t o s h   H D  HApplications/Adobe Media Encoder CC 2014/Adobe Media Encoder CC 2014.app  / ��  �+  �*  
* 
/
0
/ l 9@
1�&�%
1 I 9@�$
2�#
�$ .sysodelanull��� ��� nmbr
2 m  9<�"�" �#  �&  �%  
0 
3
4
3 l Aq
5�!� 
5 O  Aq
6
7
6 k  Gp
8
8 
9
:
9 I GP�
;�
� .fndremptnull��� ��� obj 
; 1  GL�
� 
trsh�  
: 
<�
< Z Qp
=
>��
= I Q]�
?�
� .coredoexbool        obj 
? 4  QY�
@
� 
cfol
@ o  UX�� 0 plug_folder  �  
> I `l�
A�
� .coredeloobj        obj 
A 4  `h�
B
� 
cfol
B o  dg�� 0 plug_folder  �  �  �  �  
7 m  AD
C
C�                                                                                  MACS  alis    t  Macintosh HD               ��%H+   z��
Finder.app                                                      }�хx�        ����  	                CoreServices    ���u      х�7     z�� z�� z��  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  �!  �   
4 
D�
D l     ����  �  �  �       �
E
F�  
E �
� .aevtoappnull  �   � ****
F �
G�
�	
H
I�
� .aevtoappnull  �   � ****
G k    q
J
J  
K
K   
L
L  (
M
M  7
N
N  �
O
O  �
P
P  �
Q
Q  �
R
R  �
S
S  �
T
T 
U
U &
V
V 0
W
W D
X
X L
Y
Y V
Z
Z j
[
[ 
\
\ �
]
] �
^
^ �
_
_ �
`
` �
a
a �
b
b 5
c
c B
d
d _
e
e j
f
f 	�
g
g 	�
h
h 	�
i
i 	�
j
j 

k
k 

l
l 
#
m
m 
)
n
n 
/
o
o 
3��  �
  �	  
H �� 0 
drill_file  
I��� ? C G K O S W [ _ c g k o s w {  � � � � ��� ��  ����������������� ��� ��� �����������������������������b��e��������������������������������������������������@��������fv|������������������������������������'/��9KXju�������������������������������Z\��hj����}���������� ����=?��I��U��q���������������������������DT������z|��������������������������������� �������-������������������������������~�}�|		
	�{		"	(	{	��z	�	�	�	�	��y�x� 0 good_counter  � 0 btrans_counter  � 0 bname_counter  � � 0 gizmoto  �  0 notify_good  �� 0 
notify_bad  
�� afdrdlib
�� 
from
�� fldmfldu
�� 
rtyp
�� 
TEXT�� 
�� .earsffdralis        afdr�� &0 preference_folder Preference_folder�� 0 preferencefile  
�� .ascrnoop****      � ****
�� .coredoexbool        obj 
�� .rdwropenshor       file�� $0 thefilereference theFileReference
�� 
deli
�� 
ret 
�� .rdwrread****        ****�� 0 parse_preferences  
�� .rdwrclosnull���     ****
�� 
cobj�� 0 storage_server  �� 0 storage_base  �� 0 
local_base  �� 0 ame_base  
�� 
dtxt
�� .sysodlogaskr        TEXT
�� 
rslt
�� 
ttxt�����  ��  
�� .aevtquitnull��� ��� null
�� 
prmp
�� .sysostflalis    ��� null
�� 
perm
�� 
set2
�� .rdwrseofnull���     ****
�� 
refn
�� 
wrat
�� rdwreof 
�� .rdwrwritnull���     ****
�� 
psxp�� 0 posix_local_base  
�� .misccurdldt    ��� null
�� 
mnth
�� 
long�� 0 mm  �� 

�� 
year�� 0 yy  
�� 
day �� 0 dd  �� �� 0 date_folder  �� 	0 dated  �� 0 
folder_add  
�� 
cfol
�� 
kocl
�� 
insh
�� 
prdt
�� 
pnam�� 
�� .corecrel****      � null�� 0 lrar_folder  �� 0 plug_folder  �� 0 
aja_folder  �� 0 
log_folder  �� 0 
ame_output  �� 0 counter_file  
�� 
file�� 0 parse_counter  �� 0 	good_list  �� 0 drill_files  �� 0 
drill_file  
�� 
ctxt�� 
0 prefix  
�� 
leng�� �� 0 cam  �� 0 	iteration  �� 0 basename  �� 0 lrarfile  �� 0 remote_base  �� 0 lcache_folder  �� 0 
goodfolder  �� 0 posix_ldpxfolder  �� 0 
ldpxfolder  �� 0 
lajafolder 
lajaFolder
�� .coredeloobj        obj �� 0 ldpxfile lDPXFile
�� .sysoexecTEXT���     TEXT�� 0 	rar_error  
�� 
alis�� 0 	error_msg  
�� .corecnte****       ****�� 0 name_length  �� 0 name_extension  �� 0 original_name  �� �� 0 new_name  
�� .miscactvnull��� ��� null
�� .sysodelanull��� ��� nmbr
�� .aevtodocnull  �    alis
�� 
faal
�� eMdsKcmd
�� eMdsKsft
�� .prcskprsnull���     ctxt�� 
�� 
ptsz�� 0 	firstlook  �� 0 
secondlook  
�� 
alrp
�� savoyes 
�� .coremoveobj        obj 
�� 
tab �� 0 badrarfolder  ��X
�� 
bcke
�� 
pvis
�� 
subj
�� 
ctnt�� 0 
status_msg  
�� 
trcp
�� .emsgsendnull���     bcke�� <�� 0 	cpu_usage  �� �� 0 skip  � 
0 suffix  
�~ 
psof
�} 
psin
�| .sysooffslong    ��� null�{ 0 destination  �z 0 counter_translator  
�y 
trsh
�x .fndremptnull��� ��� obj �rjE�OjE�OjE�O�������������a a a a a a a a a a vE` Oa E` Oa E` Oa a  a !a "a #a $ %a &%E` 'O_ 'a (%E` )Oa * *j +UOa ,[_ )j - b_ )j .E` /O_ /a 0_ 1l 2E` 3O_ /j 4O_ 3a 5k/E` 6O_ 3a 5l/E` 7O_ 3a 5m/E` 8O_ 3a 5a $/E` 9OPY �a :a ;a <l =O_ >a ?,E` 6O a @nhoW X A B*j CO*a Da El FE` 7O_ 7a Glva #&E` 7O*a Da Hl FE` 8O_ 8a #&E` 8O*a Da Il FE` 9O_ 9a #&E` 9O_ )a Jel .E` /O_ /a Kjl LO_ 6a #&_ 1%_ 7a #&%_ 1%_ 8a #&%_ 1%_ 9a #&%_ 1%a M_ /a Na Oa $ PO_ /j 4UO_ 8a Q,E` RO*j Sa T,a U&E` VO_ Va W a X_ Vlva #&E` VY hO*j Sa Y,E` ZO*j Sa [,a U&E` \O_ \a W a ]_ \lva #&E` \Y hO_ Za ^_ Va __ \a `va #&E` aO_ Z_ V_ \mva #&E` bOa ,�_ 8a c%E` dO*a e_ d/j - #*a fa ea g_ 8a ha ia jla k lY hO_ 8a m%E` nO_ na o%E` dO*a e_ d/j - '*a fa ea g_ 8a p%a ha ia qla k lY hO_ 8a r%E` sO_ 8a t%E` dO*a e_ d/j - #*a fa ea g_ 8a ha ia ula k lY hO_ 8a v%E` wO_ 8a x%E` dO*a e_ d/j - #*a fa ea g_ 8a ha ia yla k lY hO_ 8a z%E` {O_ 7a |%_ a%E` dO*a e_ d/j - '*a fa ea g_ 7a }%a ha i_ ala k lY hO_ 7a ~%_ a%E` dO*a e_ d/j - '*a fa ea g_ 7a %a ha i_ ala k lY hO_ 9a �%E` �UO_ {_ b%a �%E` �Oa , �*a �_ �/j - R_ �a Jel .E` /O_ /a Kjl LOa �_ 1%a �%_ 1%a �%_ 1%a M_ /a Na Oa $ PO_ /j 4Y H_ �j .E` /O_ /a 0_ 1l 2E` �O_ /j 4O_ �a 5k/E�O_ �a 5l/E�O_ �a 5m/E�UO_ 8a �%E` nOjvE` �O�hZa , *a e_ n/a �-a i,E` �UO_ �jv  Y hO_ �a 5k/a #&E` �O_ �[a �\[Zk\Zm2E` �O_ �[a �\[Za `\Z_ �a �,a �2E` �O_ �[a �\[Z_ �a �,a `\Z_ �a �,a $2E` �O_ �a �%_ �%a �%_ �%E` �O_ 8a �%_ �%a �%E` �O_ 7E` �O_ �a �  a �E` �Y hO_ �a �%E` �Oa , �_ �a �%E` dO*a e_ d/j - #*a fa ea g_ �a ha ia �la k lY hO_ �a �%E` dO*a e_ d/j - #*a fa ea g_ �a ha ia �la k lY hO_ �a �%E` dO*a e_ d/j - #*a fa ea g_ �a ha ia �la k lY hO_ �a �%E` dO*a e_ d/j - #*a fa ea g_ �a ha ia �la k lY hUO_ 8a �%E` �Oa , X_ �a �%E` �O_ �_ a%E` dO*a e_ d/j - #*a fa ea g_ �a ha i_ ala k lY hO_ �_ a%E` �UO_ Ra �%_ �%a �%E` �O_ �_ �%a �%E` �O_ 8a �%E` �Oa , J_ 8a �%E` dO*a e_ d/j - *a e_ d/j �Y  *a fa ea g_ 8a ha ia �la k lUO r_ �_ �%_ �%a �%E` �Oa �_ R%a �%_ �%a �%_ �%j �OfE` �O *a �_ �/EOfE` �W "X A BeE` �Oa �_ 1%a �%E` �O�kE�OPW "X A BeE` �Oa �_ 1%a �%E` �O�kE�O_ ��_ �_ �%E` �Oa , *a e_ �/a �-a i,E` �UO_ �jv � �_ �[a fa 5l �kh  �a �,E` �O�[a �\[Z_ �m\Z_ �2E` �O_ �a �  J_ �a �%�%E` �O_ ��[a �\[Z_ �a �\Z_ �2%E` �Oa , _ �*a �_ �/a i,FUOPY h[OY��Y hO_ �a �%_ �%a �%E` �Oa �*j �Oa `j �O_ �j �Oa � a �a �a �a �lvl �O_ 1j �UOa �j �Oa , � zhZ %*a �_ �_ �%a �%/a �,E` �Oa `j �W X A BjE` �O %*a �_ �_ �%a �%/a �,E` �Oa `j �W X A BkE` �O_ �_ �  Y h[OY��O*a �_ �_ �%a �%/a g_ wa �a �a $ �Oa `j �UO*j �Oa � a �a �a �kvl �UOPUOa , X_ �a �%E` �O_ �_ a%E` dO*a e_ d/j - #*a fa ea g_ �a ha i_ ala k lY hO_ �_ a%E` �UOa , Ta @n_ �a g*a e_ �/a �ea $ �O_ �j �O*a e_ �/a g*a e_ �/a �ea $ �O*a e_ �/j �oOPUO_ �_ �%_ 1%_ �6GO�kE�Y]_ �a �%E` �Oa , @_ �_ a%E` dO*a e_ d/j - #*a fa ea g_ �a ha i_ ala k lY hUO_ �_ a%E` �Oa , Ga �n_ �a g*a e_ �/a �ea $ �oO_ �j �O*a e_ �/j - *a e_ �/j �Y hUOa � �*a fa �a ha �ea �a �_ a%a �a �_ 1%a �%_ 1%_ 1%_ �%a �%_ �%_ 1%_ 1%a �%_ 1%a �%_ 1%_ 1%a �%_ 1%a �%_ 1%a �%a ka $ lE` �O_ � #*a fa �a g*a �-6a ha i_ la k lUO_ �j �U[OY�lOa , *a e_ w/a �-a i,E` �UO_ �jv F @_ �[a fa 5l �kh  a , !*a �_ w�%/a g*a e_ 9/a �ea $ �U[OY��Y hOa �j �O�hZ ;hZa � -a �a �%a �%j �E` �O_ �a � Y hOa �j �U[OY��Oa �j �Oa , *a e_ �/a �-a i,E` �UO_ �jv  Y\Y_ �[a fa 5l �kh  eE` �Oa �E` �O�a �,E` �O�[a �\[Z_ �m\Z_ �2E` �O�[a �\[Zk\Zm2E` �O�[a �\[Za $\Z*a �_ �a �a $k2E` �O_ �a  aE` �OaE`OfE` �Y hO_ �a  aE` �OaE`OfE` �Y hO_ �_ �_ �_ �a $va #&E` �O_ � na , d [a �n_ �*a �_ ��%/a i,FO*a �_ �_ �%/a g*a e_ �_%_ a%a	%/a �ea $ �O*a �_ �_ �%/j �oW X A BhUY hOP[OY��[OY�4O�k  a
E`Y a�%a%E`O_ �j �j �a � �*a fa �a ha �ea �a_ a%a �a_ 1%_ 1%_%_ 1%_ 1%_ �%_ 1%_ a 5.%_ 1%a%a ka $ lE` �O_ � #*a fa �a g*a �-6a ha i_ la k lUO_ �j �UY hO_ �a Jel .E` /O_ /a Kjl LO�_ 1%�%_ 1%�%_ 1%a #&a M_ /a Na Oa $ PO_ /j 4Oa � *j CUOa * *j CUOa `j �Oa , +*a,jO*a e_ s/j - *a e_ s/j �Y hUascr  ��ޭ