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
BZh91AY&SY��c| <_��P~���_�p?��� ���@ @ P��:9�P]��H�O�=F54�mC@� @=M� %
aS��$�  hh    "$�)�� ��OP4zCC�h���d��dɄ� d4��&� M��OH�i12��4 M2��� 2P`�f���/�nB�z��P������9oc�q�;�"�D�U����� � 
�E��H�����Q�,�i�"��Ͱxb�H�( YP�E�b)�7�$��38�뒭 tջb|u*�Ifش��g��ϙFs-|ױ:��
�ꐪ�*lo���ʈ�Z�..��E$4�����,:���i��`���i�;f+!b��(}��f�`7�އ�!r�`W@���hlL�y���aJ�	�_=ѵ�S�W��M"�^� �h��[:ZwTb�@��F��2�ZA6�CkּB������u�|8��b��@�@YŠU
�Y�f���	ӰL��y��"��7�`�jVn��"�����P���;h�mjp�o�x�t��4K��,y�$p����.�UW�J��J�S�[sJ��&�+����5�"#$�e|�5��
��)��H���b�����}�1$����a���4/�cH�(��"��q��:MD�d�b�#RH�豗����P�s8��Ԧ,���,�Uf�F�Ā�B�.R�g��A�#&����B�[8�r���V:`!�m�C7ye��;T&���9;IA�a�J��X7��2�TH����YKp�*��Q964Snلf,Q/$q�@LD*L����+�"J�&x)N,"[!:F���0���Q�	dx+Ա�rJ���ͬW����l�=UM9���ډdYɖ�3��K�T�����9#*�����}���z0U���#�GA� %)��]��BB�	��