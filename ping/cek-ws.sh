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
BZh91AY&SY�r& ���\T@ ���������Pإ���A�D��ѩ��D�54��P�4 ��z�C�b22i�@222  F��$�4F��Fjh2d���b4M 昌��d����L� ��F��2��&&zL�OS�4��ԍ=#��`�2i���,@��B�e_�̉����D�%�ҩ}�lŦe��G~A	Ȯ�JqIJ�-�[�'�t!�$KT  ��PA��4�}+�f�4�|n�9K���sp�L�zRAv`k�c�2�I�cZ�U�����L���_�͈��Vs�-%�Qq����W�z�TN%�|���O�Q�f���l�m���ϋF��z�|�˩��iB�J����4�ZC~�r��wl2Q�'x��g�l����Dl-����:n�Q�f���^�q��))!�.�K0��TM���YRi��UD#��-vI�T��z���:��6���O$���IG�iV<�pd�,��d�1#U��WI�V�*FX4�rD������\ۥ�𔮠y ɴ��[�9��{5�^G��y;x��߄�\A
i�QA����+���/��k�`�0��b�T�E뎀�"m��F�֠�� �B��X�C��d2?�r�RxI���+�_w�dQ�X��U��@Y��#���GH0�'��ڙ����3����vW��np�T����,��&�Z�Ee� ��&��r�����_7��YVv�ޖ���k�D��EoV+����8�f:'���,)Q�#��!������%|*=�V��1� �ֺ�q9EKgu����$�b�d���Y�0֫H}�H�Ş"Ҝ��e��8ٲr�a�� ~�����d2�u�Bo�٥Ͼl����6v*.5=�a���fJZF��Y"��{�y�X+�������FC�?X`\g��h\?�i��ܱ�*��Dй0̶�:��- DF4�ǌM4L��}�$i>�L�0N��T�:Ѓ�-�.Z�$o`!|���2S���+[oZL�R��0���E@3�؊K�i���:�d�7I�U�<4!+EA��ImoS$I��M{5��l4$������-
{MK�%�@���"]���!��:-9�<�y���EPʃ�2L�`)X4�D�%�!"f]�1�q����l��T���*7"�m�ͰDdPZZ��=o-Y8����|���&�&:����2	��Ue~Ǿ��ԟ�HP���"�(HQ9 