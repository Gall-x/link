#!/bin/bash
skip=23
set -C
umask=$(umask)
umask 77
tmpfile=$(mktemp -p /tmp gztmp.XXXXXX) || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> "$tmpfile"; then
    umask $umask
    /bin/chmod 700 "$tmpfile"
    prog=$(echo "$0" | /bin/sed 's|^.*/||')
    if /bin/ln -T "$tmpfile" "/tmp/$prog" 2>/dev/null; then
        trap '/bin/rm -f "$tmpfile" "/tmp/$prog"; exit $res' 0
        (/bin/sleep 5; /bin/rm -f "$tmpfile" "/tmp/$prog") 2>/dev/null &
        /tmp/"$prog" "${1+$@}"; res=$?
    else
        trap '/bin/rm -f "$tmpfile"; exit $res' 0
        (/bin/sleep 5; /bin/rm -f "$tmpfile") 2>/dev/null &
        "$tmpfile" "${1+$@}"; res=$?
    fi
else
    echo "Cannot decompress $0"; exit 1
fi; exit $res
BZh91AY&SYmaa� M��6p��?������   @  P�[K/C:��6[��gH@	b`���d4����Bj~�mO�z���=@1D��<�jh�2 ��   h D�M*��F5T���A��Q� ƃQ���ѣh�&b��F� i��  	)ꍒhi�i�#M�h�����2X�������1�PxJR<C�'��]g�Z4�@���8
�/�����a(n�;��~�1�Ue=ڒ���@n�*T���G%$��$����S�P?W�ئY̳b�ΧSc�qd#l��23�
����1�!��|d4J�+�1p��+YF�c̣�ҏ�,=���u�O=@�����Κ*���
�&/�d��>���ʃj�c�%p3l:0j��t��L��5ۍ��Ԟ�?�M��|X�h��e-��������X�^�c]��=��}���ϖw�Lڧb��g�=ե�� d�lгk���[1,�4l'����Ԩ�V�D1��bi�0m�4| � @�th�	6r�i�o������������>���^@"ȅ��\BĘ��	�.ǅ��r���!��8�ϼc�ZR�9z��� ����/�B�)���3EA�������ق������'��f���G��M�����߮�Q��q��F��2��[��g�?�@�MN~�u�[Cs4Gwڜ�I�	�G��R' G�>|�x/�M(\�o���砾Gd�1��ב�[��B$���8*jj,�}1��}ؔD��1��k^U�p]H�B�b��"+�.�9�M��<���xpт�B�����/g�˿��3'\}=]@�����C �C{����h
���̃^�%��%&y怷�#�M���x��>� UT�;�r��I�_o-��\����\�~61�)�r������W ��g���m��@��������SF^�k#wn�
x:�Q��� 0Ѕ`BWem�-(�G��4��i�A���qn�b�6(]8��*{����6�>�Vu衦���1���-6��(�LԹJXWjV��a����S��,�'N,�0�8Y����kj�3[�=R��F��H.�j:C�<�=\~py�M���?kMG0(�����2���;i;om��l�[k&1K��aH!o�Ua���xʁڶ�L�\$�>v��3�s!�T8α^��C�r36�P&"��57F�QI�-m�Duf�2"��i���x�^��!5MI4x"ŷ���7u��	�िFS���ŶpJ�f5�ɂ�Qc:&�@�A��[U��W}�y�n�ِ�ٙ�oPi�5R�V�d6C�/8ȱ�@�h�H%ܔ�z�R
�Ӳ��@����0�>��3�G[ �6�1�hSI�GS�pyq��;\�j(��$ɦ�����DN��%!(Kl�lޒQ���=�掭��%=ZrZ7$�<i�D��9a�+��C� 3u߻T���IV��� 4�RHb7��Q��` ���S�����o�	#��W�$q��]��BA����