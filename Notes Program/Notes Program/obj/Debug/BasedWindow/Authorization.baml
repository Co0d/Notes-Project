   M S B A M L   `   `   `  ����H  DNotes Program, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:Notes_ProgramNotes_Program  5   	   !    Notes_Program.Authorization   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   -localclr-namespace:Notes_Program     5   	   -   5          � Title$  Notes��5   	   $	��450��5	   	   $	��800��6    � WindowStartupLocation$ CenterScreen=�5
   	    � WindowStyle$
 None=�5   	    � 
ResizeMode$ NoResize=�5   	   .��5      �  � ColumnDefinitions 5   
   �� 5      $��* �6   �� 5      $��* �6    � RowDefinitions 5   
   �� 5      $��25 �6   �� 5      $��* �6   .+�5!   
   �� -   5        $��1��5!      $��0��6!   $��Right=�5"      $��20��5#      $��20��6   $	��✖��5$      $��0q�5%      
������ ���	#FF3AA3DC � 	Resources 5)       �� 
TargetType �� Property	 �� Value��%_   '��       �� 5*      " ��6   .�5+      ��  �@��CornerRadius$	 50��65   5,      5-      5.      �� 50   
   
 �� Orientation$
 
Horizontal=�6   $��0��51      $��0��6%   .+�52      �� $��/Resources/Logo.png��6   $��20��53      $��20��6   $
��Left=�54      $��5,0,0,0q�55      �� 56      $��Notes��6   $��20��57      $��8(�58      $
��Bold"�59      ���	#FF3AA3DC5:      5;      � 5?   
   $��0��6   $��1��6   .+�5@      �� $
 Vertical=�6   $��Center=�5A      $��Center=�5B      .+�5C      �� $��/Resources/Logo.png��6   $	��200��5D      $	��200��6$   �� 5E      $��Notes��6   $��24(�5F      $
��Bold"�5G      ���	#FF3AA3DC$��Center=�5I      5J      5K      � 5O   
   $��1��6   $��1��6    5R      �� 5S      $��25 �6#   �� 5T      $��* �6#   �� 5U      $��25 �6#   .+�5Y       � -   5          �Name$ 	AuthFrame��5Z      $��1��5Y        � NavigationUIVisibility$ Hidden=�5[      5\      5]      5^      