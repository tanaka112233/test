 #--*-coding:utf-8-*--
 
class KanColle < DiceBot
	def initialize
		super
		@sendMode = 2
		@sortType = 3
		@d66Type = 2
	end
 
	def gameName
		'�͂���RPG'
	end
 
	def gameType
		"KanColle"
	end
 
	#�g�p�ł���R�}���h
	def prefixs
		['ET', 'ACT', 'CNT', 'CNTM', 'MKT', 'SST', 'CMT', 'YMT', 'SYT', 'KBT', 'SIT', 'SPT', 'SKT',
			'KTT','KTTM', 'TMT', 'TNKY', 'TNJK', 'KIKY', 'KIJK',  'EVNT', 'EVKT', 'EVAT', 'EVET', 'EVENT', 'EVST',
			'ETHT', 'ETKOT', 'ETGT', 'ETGET', 'ETNIT', 'ETKYT', 'ETIT', 'ETSVT',
			'DVT', 'DVTM', 'WP1T', 'WP2T', 'WP3T', 'WP4T', 'WPHO', 'WPKN', 'WPTK', 'WPST', 'ITT', 'MHT', 'DNT', 'SNT', 'TSNT',
			'KTM', 'BT', 'KHT', 'KMT', 'KST', 'KSYT', 'KKT', 'KSNT', 'SNZ', 'ENSK', 'BOSO', 'YMM', 'TTGK', 'SMT',
		]
	end
 
	#�}�j���A��
	def getHelpMessage
		info = <<INFO_MESSAGE_TEXT
��) 2D6 �F �P���ɂQ�c�U�����l���o���܂��B
��) 2D6>=7 �F �s�ה���B�Q�c�U���ĖڕW�l7�ȏ�o��ΐ����B
��) 2D6+2>=7 �F �s�ה���B�Q�c�U�ɏC��+2��������ŖڕW�l7�ȏ�ɂȂ�ΐ����B
 
2D6�ł̍s�ה��莞��1�]���Ńt�@���u���A6�]���ŃX�y�V���������ɂȂ�܂��B
�V�������X�y�V�����͎蓮�Ŕ��肵�Ă��������B
 
�e��\
�@�E����\�@ET�^�A�N�V�f���g�\�@ACT
�@�E����{������\�@CNT�^����{��(�ꊇ)�@CNTM
�@�@�����\�@MKT
�@�@�C���\�@SST�^�n���\�@CMT�^�E�ҕ\�@YMT�^�A���\�@�@SYT
�@�@�z�Ε\�@KBT�^�����\�@SIT�^����\�@SPT�^�g�D�\�@�@SKT
�@�@�͑�������\�@KTT�^�͑���(�ꊇ)�@KTTM�^�`�[���\�@TMT
�@�E����{�`�e�\�@TNKY�^����{��i�\�@TNJK
�@�E�C��`�e�\�@�@KIKY�^�C���i�\�@�@KIJK
�@�E�@����C�x���g�\�@�@EVNT�^�𗬃C�x���g�\�@EVKT �^�V�уC�x���g�\�@EVAT
�@�@�@���K�C�x���g�\�@�@EVET�^�����C�x���g�\�@EVENT�^���C�x���g�\�@EVST
�@�E�ق̂ڂ̃C�x���g�\�@ETHT�^�q�C�C�x���g�\�@ETKOT�^�O�o�C�x���g�\�@ETGT
�@�@�@����C�x���g�\�@ ETGET�^�C���C�x���g�\�@ETNIT�^���|�C�x���g�\�@ETKYT
         �T���x�[�W�\�@ETSVT�^�A�C�h���\    �@ETIT
�@�E�J���\�@DVT�^�J���\(�ꊇ)DVTM
�@�@�@�@����1��\ �@�@WP1T�^����2��\�@  WP2T�^����3��\�@ WP3T�^����4��\�@WP4T
�@�@�@�@�C�ފJ���\�@�@WPHO�^�͍ڋ@�J���\ WPKN�^����J���\�@WPTK
�@�@�@�V�E����J���\�@WPST
�@�E�A�C�e���\�@ITT�^��ʕ\�@SNT�^���ʕ\�@TSNT
�@�E�ڕW�\�@MHT�^�����\�@DNT�^�g���\�@SMT
�@�E�����_�����I���F�ꊇ�@KTM�^����@BT
�@�@�@�w�i�@KHT�^���́@KMT�^���i�@KST�^��@KSYT�^�q�C�@KKT�^�퓬�@KSNT
�@�E���\�@SNZ�^�N�U���ʕ\�@ENSK
�@�E�\���\�@BOSO�^�����\�@YMM
�@�E��O���\�@TTGK
 
�ED66�_�C�X(D66S����=�Ⴂ����10�̌��ɂȂ�)
INFO_MESSAGE_TEXT
	end
 
	def check_2D6(total_n, dice_n, signOfInequality, diff, dice_cnt, dice_max, n1, n_max)  # �Q�[���ʐ����x����(2D6)
		return '' unless( signOfInequality == ">=")
 
		if(dice_n <= 2)
			return " �� �t�@���u��(���莸�s�B�A�N�V�f���g�\�������̂o�b�ɓK�p)"
		elsif(dice_n >= 12)
			return " �� �X�y�V����(���萬���B�y�s���́z��1�c6�_��)"
		elsif(total_n >= diff)
			return " �� ����"
		else
			return " �� ���s"
		end
	end
 
	def rollDiceCommand(command)
		output = '1'
		type = ""
		total_n = ""
 
		case command
 
		when 'ET'
			type='����\'
			output, total_n =  get_emotion_table
		when 'ACT'
			type='�A�N�V�f���g�\'
			output, total_n =  get_accident_table
 
			#����{���E�͑�������\
		when 'CNT'
			type='����{������\'
			output, total_n =  get_chinjyufuname_table
		when 'CNTM'
			type='����{��(�ꊇ)'
			output, total_n =  get_chinjyufuname_matome_table
		when 'MKT'
			type='�����\'
			output, total_n =  get_makurakotoba_table
		when 'SST'
			type='�C���\'
			output, total_n =  get_syuusyoku_table
		when 'CMT'
			type='�n���\'
			output, total_n =  get_chimei_table
		when 'YMT'
			type='�E�ҕ\'
			output, total_n =  get_yuumou_table
		when 'SYT'
			type='�A���\'
			output, total_n =  get_syokubutsu_table
		when 'KBT'
			type='�z�Ε\'
			output, total_n =  get_koubutsu_table
		when 'SIT'
			type='�����\'
			output, total_n =  get_suisei_table
		when 'SPT'
			type='����\'
			output, total_n =  get_tokusyu_table
		when 'SKT'
			type='�g�D�\'
			output, total_n =  get_soshiki_table
		when 'KTT'
			type='�͑�������\'
			output, total_n =  get_kantainame_table
		when 'KTTM'
			type='�͑���(�ꊇ)'
			output, total_n =  get_kantainame_matome_table
		when 'TMT'
			type='�`�[���\'
			output, total_n =  get_team_table
 
			#���i����\
		when 'TNKY'
			type='����{�`�e�\'
			output, total_n =  get_tinjufukeiyou_table
		when 'TNJK'
			type='����{��i�\'
			output, total_n =  get_tinjufujoukei_table
		when 'KIKY'
			type='�C��`�e�\'
			output, total_n =  get_kaiikikeiyou_table
		when 'KIJK'
			type='�C���i�\'
			output, total_n =  get_kaiikijoukei_table
 
			#�C�x���g�\
		when 'EVNT'
			type='����C�x���g�\'
			output, total_n =  get_nichijyou_event_table
		when 'EVKT'
			type='�𗬃C�x���g�\'
			output, total_n =  get_kouryu_event_table
		when 'EVAT'
			type='�V�уC�x���g�\'
			output, total_n =  get_asobi_event_table
		when 'EVET'
			type='���K�C�x���g�\'
			output, total_n =  get_ensyuu_event_table
		when 'EVENT'
			type='�����C�x���g�\'
			output, total_n =  get_ensei_event_table
		when 'EVST'
			type='���C�x���g�\'
			output, total_n =  get_sakusen_event_table
 
			#�ǉ��C�x���g�\
		when 'ETHT'
			type='�ق̂ڂ̃C�x���g�\'
			output, total_n =  get_honobono_event_table
		when 'ETKOT'
			type='�q�C�C�x���g�\'
			output, total_n =  get_koukai_event_table
		when 'ETGT'
			type='�O�o�C�x���g�\'
			output, total_n =  get_gaisyutu_event_table
		when 'ETGET'
			type='����C�x���g�\'
			output, total_n =  get_gekisen_event_table
		when 'ETNIT'
			type='�C���C�x���g�\'
			output, total_n =  get_ninmu_event_table
		when 'ETKYT'
			type='���|�C�x���g�\'
			output, total_n =  get_kyoufu_event_table
		when 'ETSVT'
			type='�T���x�[�W�C�x���g�\'
			output, total_n =  get_salvage_event_table
		when 'ETIT'
			type='�A�C�h���C�x���g�\'
			output, total_n =  get_idol_event_table
 
			# �J���\
		when 'DVT'
			type='�J���\'
			output, total_n =  get_develop_table
		when 'DVTM'
			type='�J���\(�ꊇ)'
			output, total_n =  get_develop_matome_table
		when 'WP1T'
			type='����1��\'
			output, total_n =  get_weapon1_table
		when 'WP2T'
			type='����2��\'
			output, total_n =  get_weapon2_table
		when 'WP3T'
			type='����3��\'
			output, total_n =  get_weapon3_table
		when 'WP4T'
			type='����4��\'
			output, total_n =  get_weapon4_table
		when 'WPHO'
			type='�C�ފJ���\'
			output, total_n =  get_Cannon_table
		when 'WPKN'
			type='�͍ڋ@�J���\'
			output, total_n =  get_plane_table
		when 'WPTK'
			type='����J���\'
			output, total_n =  get_special_table
		when 'WPST'
			type='�V�E����J���\'
			output, total_n =  get_new_special_table
 
		when 'ITT'
			type='�A�C�e���\'
			output, total_n =  get_item_table
		when 'SNT'
			type='��ʕ\'
			output, total_n =  get_senka_table
		when 'TSNT'
			type='�����ʕ\'
			output, total_n =  get_special_senka_table
 
		when 'MHT'
			type='�ڕW�\'
			output, total_n =  get_mokuhyou_table
		when 'DNT'
			type='�����\'
			output, total_n =  get_dounyuu_table
 
		when 'KTM'
			type='���F�ꊇ'
			output, total_n =  get_kosei_table
		when 'BT'
			type='���F����\'
			output, total_n =  get_bunya_table
		when 'KHT'
			type='���F�w�i�\'
			output, total_n =  get_kosei_haikei_table
		when 'KMT'
			type='���F���͕\'
			output, total_n =  get_kosei_miryoku_table
		when 'KST'
			type='���F���i�\'
			output, total_n =  get_kosei_seikaku_table
		when 'KSYT'
			type='���F��\'
			output, total_n =  get_kosei_syumi_table
		when 'KKT'
			type='���F�q�C�\'
			output, total_n =  get_kosei_koukai_table
		when 'KSNT'
			type='���F�퓬�\'
			output, total_n =  get_kosei_sentou_table
 
		when 'SNZ'
			type='���\'
			output, total_n =  get_senzyou_table
		when 'ENSK'
			type='�N�U���ʕ\'
			output, total_n =  get_sinkoukouka_table
		when 'BOSO'
			type='�\���\'
			output, total_n =  get_bousou_table
		when 'YMM'
			type='�����\'
			output, total_n =  get_yumemi_table
		when 'TTGK'
			type='��O���\'
			output, total_n =  get_tgaiken_table
		when 'SMT'
			type='�g���\'
			output, total_n =  get_shimei_table
 
		end
 
		return "#{type}(#{total_n}) �� #{output}"
 
	end
 
	# ����\�@���C�m��P49
	def get_emotion_table
		table = [
			'���킢��(�v���X)�^�ނ���(�}�C�i�X)',
			'������(�v���X)�^����˂�(�}�C�i�X)',
			'���̂���(�v���X)�^���킢(�}�C�i�X)',
			'����������(�v���X)�^����ς�(�}�C�i�X)',
			'���Ƃ���(�v���X)�^���܂��Ăق���(�}�C�i�X)',
			'��������(�v���X)�^���������炢(�}�C�i�X)',
		]
 
		return get_table_by_1d6(table)
	end
 
	# �A�N�V�f���g�\�@���C�m��P206
	def get_accident_table
		table = [
			'�悩�������B�����Ȃ��B',
			'�ӊO�Ȏ艞���B���̔���Ɏg�������̑���(�y�����z�Ɓy��_�z)�����΂ɂȂ�B������������s���Ƃ��ȊO�͂��̌��ʂ͖�������B',
			'���[��B�厸�ԁB���̃L�����N�^�[�ɑ΂��āy����l�z�������Ă���L�����N�^�[�S���̐������Ƀ`�F�b�N������B',
			'��ȔL���܂Ƃ����B�T�C�N���̏I�����A�������́A�͑���̏I�����܂ŁA�����̍s���s�ה���Ƀ}�C�i�X1�̏C������(���̌��ʂ́A�}�C�i�X2�܂ŗݐς���)�B',
			'���ĂĂāB���������������B�������͑��풆�Ȃ�A�����Ɠ����q�s����ɂ��閡���͂ɂ����������������B',
			'�������B��肷����������I�����́y�s���́z��1�c6�_��������B',
		]
 
		return get_table_by_1d6(table)
	end
 
	# ����{������\�@���C�m��P211
	def get_chinjyufuname_table
		table = [
			'�n���\+����\+�g�D�\',
			'�n���\+�A���\+�g�D�\',
			'�����\+�A���\+�g�D�\',
			'�����\+����\+�g�D�\',
			'�����\+�n���\+�g�D�\',
			'�n���\+�E�ҕ\+�g�D�\',
			'�C���\+�n���\+�g�D�\',
			'�C���\+����\+�g�D�\',
			'�C���\+�A���\+�g�D�\',
			'�n���\+�����\+�g�D�\',
			'�n���\+�z�Ε\+�g�D�\',
		]
		return get_table_by_2d6(table)
	end
 
	# ����{��(�܂ƂߐU��)
	def get_chinjyufuname_matome_table
		output1 = '1'
		output2 = '2'
		output3 = '3'
		total_n1 = ""
		total_n2 = ""
		total_n3 = ""
 
		dice, diceText = roll(2, 6)
 
		case dice
		when 2
			output1, total_n1 =  get_chimei_table
			output2, total_n2 =  get_tokusyu_table
			output3, total_n3 =  get_soshiki_table
		when 3
			output1, total_n1 =  get_chimei_table
			output2, total_n2 =  get_syokubutsu_table
			output3, total_n3 =  get_soshiki_table
		when 4
			output1, total_n1 =  get_makurakotoba_table
			output2, total_n2 =  get_syokubutsu_table
			output3, total_n3 =  get_soshiki_table
		when 5
			output1, total_n1 =  get_makurakotoba_table
			output2, total_n2 =  get_tokusyu_table
			output3, total_n3 =  get_soshiki_table
		when 6
			output1, total_n1 =  get_makurakotoba_table
			output2, total_n2 =  get_chimei_table
			output3, total_n3 =  get_soshiki_table
		when 7
			output1, total_n1 =  get_chimei_table
			output2, total_n2 =  get_yuumou_table
			output3, total_n3 =  get_soshiki_table
		when 8
			output1, total_n1 =  get_syuusyoku_table
			output2, total_n2 =  get_chimei_table
			output3, total_n3 =  get_soshiki_table
		when 9
			output1, total_n1 =  get_syuusyoku_table
			output2, total_n2 =  get_tokusyu_table
			output3, total_n3 =  get_soshiki_table
		when 10
			output1, total_n1 =  get_syuusyoku_table
			output2, total_n2 =  get_syokubutsu_table
			output3, total_n3 =  get_soshiki_table
		when 11
			output1, total_n1 =  get_chimei_table
			output2, total_n2 =  get_suisei_table
			output3, total_n3 =  get_soshiki_table
		when 12
			output1, total_n1 =  get_chimei_table
			output2, total_n2 =  get_koubutsu_table
			output3, total_n3 =  get_soshiki_table
		end
		result = "#{output1}�b#{output2}�b#{output3}"
		number = "#{dice},#{total_n1},#{total_n2},#{total_n3}"
		return result, number
	end
 
	# �����\�@���C�m��P211
	def get_makurakotoba_table
		table = [
			[11, '��[1�c6]'],
			[12, '�ŋ�'],
			[13, '����'],
			[14, '���'],
			[15, '�ɏ�'],
			[16, '���c�@�l'],
			[22, '�@(��������)'],
			[23, '�V'],
			[24, '������'],
			[25, '���_'],
			[26, '�Ɨ�'],
			[33, '��[2�c6]'],
			[34, '�_��'],
			[35, '��'],
			[36, '����'],
			[44, '����'],
			[45, '�d��'],
			[46, '�������'],
			[55, '�����'],
			[56, '����'],
			[66, '��[�c66]'],
		]
		return get_table_by_d66_swap(table)
	end
 
	# �C���\�@���C�m��P212
	def get_syuusyoku_table
		table = [
			[11, '�h���Ȃ�'],
			[12, '�Ō��'],
			[13, '�����H��'],
			[14, '������'],
			[15, '�f�r��'],
			[16, '�Q����'],
			[22, '�閧��'],
			[23, '������'],
			[24, '�{���'],
			[25, '���Q��'],
			[26, '�R����'],
			[33, '�݂�Ȃ�'],
			[34, '���h���'],
			[35, '�F�E����'],
			[36, '��݂�����'],
			[44, '������Ȃ�'],
			[45, '�閾����'],
			[46, '�܂ڂ낵��'],
			[55, '�܂��܂�'],
			[56, '�͂�����'],
			[66, '�~�j�~�j'],
 
		]
		return get_table_by_d66_swap(table)
	end
 
	# �n���\�@���C�m��P212
	def get_chimei_table
		table = [
			[11, '���݃Q�[�����s���Ă���ꏊ�̒n��'],
			[12, '�ԑ��^�A�o�V��'],
			[13, '�喩�^�I�I�~�i�g'],
			[14, '�����^�g�E�L���E'],
			[15, '���{��^���R�X�J'],
			[16, '���É��^�i�S��'],
			[22, '���߁^�}�C�d��'],
			[23, '�_�ˁ^�R�E�x'],
			[24, '���^�N��'],
			[25, '�����ہ^�T�Z�{'],
			[26, '�ߔe�^�i�n'],
			[33, '�g���b�N'],
			[34, '���o�E��'],
			[35, '�V���[�g�����h'],
			[36, '�u�C��'],
			[44, '�^�E�C�^�E�C'],
			[45, '�p���I'],
			[46, '�u���l�C'],
			[55, '�P���p�^�q�g�J�b�v����'],
			[56, '�y⥁^�p�����V��'],
			[66, '���͖͂̊�'],
 
		]
		return get_table_by_d66_swap(table)
	end
 
	# �E�ҕ\�@���C�m��P212
	def get_yuumou_table
		table = [
			[11, '����'],
			[12, '���肱��'],
			[13, '�A��'],
			[14, '����'],
			[15, '�V��'],
			[16, '����'],
			[22, '����'],
			[23, '�@��'],
			[24, '���G'],
			[25, '����'],
			[26, '����'],
			[33, '�h�q'],
			[34, '�퍑'],
			[35, '��A'],
			[36, '�n��'],
			[44, '�M��'],
			[45, '���_'],
			[46, '�Ӌ�'],
			[55, '����'],
			[56, '�F��'],
			[66, '��̕c��'],
		]
		return get_table_by_d66_swap(table)
	end
 
	# �A���\�@���C�m��P212
	def get_syokubutsu_table
		table = [
			[11, '�K�N�^�o��'],
			[12, '���^�T�N��'],
			[13, '���^�A�I�C'],
			[14, '䕁^�C�`�S'],
			[15, '���O�^�{�^��'],
			[16, '�铍�^�X����'],
			[22, '���m�ԁ^�o�i�i'],
			[23, '���w�^�A�X�i��'],
			[24, '�������^�q�}����'],
			[25, '���q�^�i�f�V�R'],
			[26, '�S���^�z�I�Y�L'],
			[33, '�����^�~�J��'],
			[34, '俁^�X�~��'],
			[35, '�ь�^�����S'],
			[36, '�j�[�^�L�L���E'],
			[44, '�Ξց^�U�N��'],
			[45, '���@�^�X�C����'],
			[46, '�����p�^�^���|�|'],
			[55, '�@�؁^�����Q'],
			[56, '�ӓ��^�N���~'],
			[66, '�S���^����'],
		]
		return get_table_by_d66_swap(table)
	end
 
	# �z�Ε\�@���C�m��P213
	def get_koubutsu_table
		table = [
			[11, '�����^�R���S�E'],
			[12, '�Ő��^�q�X�C'],
			[13, '�g�ʁ^�R�E�M���N'],
			[14, '�ڗ��^����'],
			[15, '�����^�X�C�V���E'],
			[16, '�ɋʁ^�w�L�M���N'],
			[22, '����^���m�E'],
			[23, '���߁^�R�n�N'],
			[24, '�^��^�V���W��'],
			[25, '�_��^�E����'],
			[26, '�Ήp�^�Z�L�G�C'],
			[33, '�����^�I�E�S��'],
			[34, '����^�V���K�l'],
			[35, '���^�Z�C�h�E'],
			[36, '���j�^�R�N���E'],
			[44, '�ӊD�^�����J�C'],
			[45, '�����^�C�I�E'],
			[46, '�֖�^�W������'],
			[55, '�Ֆځ^�g����'],
			[56, '�����^�V���R�E'],
			[66, '�␯�^�M���Z�C'],
		]
		return get_table_by_d66_swap(table)
	end
 
	# �����\�@���C�m��P213
	def get_suisei_table
		table = [
			[11, '�J�W�L�^�\�[�h�t�B�b�V��'],
			[12, '�V���`�^�I���J'],
			[13, '�N�W���^�z�G�[��'],
			[14, '�}�O���^�c�i'],
			[15, '�}���{�E�^���[��'],
			[16, '�C���J�^�h���t�B��'],
			[22, '�G�C�^�X�e�B���O���C'],
			[23, '�T���^�V���[�N'],
			[24, '�g�r�E�I�^�t���C���O�t�B�b�V��'],
			[25, '�A���R�E�^�A���O���['],
			[26, '�N���Q�^���f���[�T'],
			[33, '�E�c�{�^���[���C'],
			[34, '�I�j�J�}�X�^�o���N�[�_'],
			[35, '�h�W���E�^���[�`'],
			[36, '�C�J�^�X�N�C�h'],
			[44, '���j�^�A���Q�[�^�['],
			[45, '�Z�C�E�`�^���E���X'],
			[46, '�l���^�}�[���C�h'],
			[55, '�͓��^�J�b�p'],
			[56, '�C�ց^�V�[�T�[�y���g'],
			[66, '��C���^�N���[�P��'],
		]
		return get_table_by_d66_swap(table)
	end
 
	# ����\�@���C�m��P213
	def get_tokusyu_table
		table = [
			[11, '�Ɋy'],
			[12, '��F'],
			[13, '�S��'],
			[14, '�΂�����'],
			[15, '�t'],
			[16, '�����ς�'],
			[22, '���炭��'],
			[23, '�����'],
			[24, '�y���y��'],
			[25, '�h���S��'],
			[26, '�q�L'],
			[33, '�A�I�V�}'],
			[34, '�u���b�N'],
			[35, '�I�����C��'],
			[36, '�l��'],
			[44, '�ւ��ۂ�'],
			[45, '����񂫂��'],
			[46, '�����킹'],
			[55, '�ӂ�ǂ�'],
			[56, '�T�C�R��'],
			[66, '���͖͂̊�'],
		]
		return get_table_by_d66_swap(table)
	end
 
	# �g�D�\�@���C�m��P213
	def get_soshiki_table
		table = [
			[11, '����{'],
			[12, '��{'],
			[13, '�x���{'],
			[14, '�v�`�{'],
			[15, '��n'],
			[16, '���n'],
			[22, '�A�J�f�~�['],
			[23, '�w��'],
			[24, '�����c'],
			[25, '�̌��c'],
			[26, '�v���_�N�V����'],
			[33, '�v��'],
			[34, '�g�~��'],
			[35, '�`'],
			[36, '����'],
			[44, '��'],
			[45, '��'],
			[46, '���X�X'],
			[55, '����'],
			[56, '�@��'],
			[66, '�鍑'],
		]
		return get_table_by_d66_swap(table)
	end
 
	# �͑�������\�@���C�m��P214
	def get_kantainame_table
		table = [
			'�n���\+����\+�`�[���\',
			'�n���\+�A���\+�`�[���\',
			'�����\+�A���\+�`�[���\',
			'�����\+����\+�`�[���\',
			'�����\+�n���\+�`�[���\',
			'�n���\+�E�ҕ\+�`�[���\',
			'�C���\+�n���\+�`�[���\',
			'�C���\+����\+�`�[���\',
			'�C���\+�A���\+�`�[���\',
			'�n���\+�����\+�`�[���\',
			'�n���\+�z�Ε\+�`�[���\',
		]
		return get_table_by_2d6(table)
	end
 
	# �͑�����(�܂ƂߐU��)
	def get_kantainame_matome_table
		output1 = '1'
		output2 = '2'
		output3 = '3'
		total_n1 = ""
		total_n2 = ""
		total_n3 = ""
 
		dice, diceText = roll(2, 6)
 
		case dice
		when 2
			output1, total_n1 =  get_chimei_table
			output2, total_n2 =  get_tokusyu_table
			output3, total_n3 =  get_team_table
		when 3
			output1, total_n1 =  get_chimei_table
			output2, total_n2 =  get_syokubutsu_table
			output3, total_n3 =  get_team_table
		when 4
			output1, total_n1 =  get_makurakotoba_table
			output2, total_n2 =  get_syokubutsu_table
			output3, total_n3 =  get_team_table
		when 5
			output1, total_n1 =  get_makurakotoba_table
			output2, total_n2 =  get_tokusyu_table
			output3, total_n3 =  get_team_table
		when 6
			output1, total_n1 =  get_makurakotoba_table
			output2, total_n2 =  get_chimei_table
			output3, total_n3 =  get_team_table
		when 7
			output1, total_n1 =  get_chimei_table
			output2, total_n2 =  get_yuumou_table
			output3, total_n3 =  get_team_table
		when 8
			output1, total_n1 =  get_syuusyoku_table
			output2, total_n2 =  get_chimei_table
			output3, total_n3 =  get_team_table
		when 9
			output1, total_n1 =  get_syuusyoku_table
			output2, total_n2 =  get_tokusyu_table
			output3, total_n3 =  get_team_table
		when 10
			output1, total_n1 =  get_syuusyoku_table
			output2, total_n2 =  get_syokubutsu_table
			output3, total_n3 =  get_team_table
		when 11
			output1, total_n1 =  get_chimei_table
			output2, total_n2 =  get_suisei_table
			output3, total_n3 =  get_team_table
		when 12
			output1, total_n1 =  get_chimei_table
			output2, total_n2 =  get_koubutsu_table
			output3, total_n3 =  get_team_table
		end
		result = "#{output1}�b#{output2}�b#{output3}"
		number = "#{dice},#{total_n1},#{total_n2},#{total_n3}"
		return result, number
	end
 
	# �`�[���\�@���C�m��P215
	def get_team_table
		table = [
			[11, '�͑�'],
			[12, '���R'],
			[13, '�D�c'],
			[14, '�C����'],
			[15, '�R�m�c'],
			[16, '���c'],
			[22, '�t�c'],
			[23, '���'],
			[24, '����'],
			[25, '�C���c'],
			[26, '�R�c'],
			[33, '�o��'],
			[34, '������'],
			[35, '��'],
			[36, '�V��'],
			[44, '�T����'],
			[45, '�g'],
			[46, '�̉�������'],
			[55, '���q�R'],
			[56, '����'],
			[66, '��'],
		]
		return get_table_by_d66_swap(table)
	end
 
	# ����{�`�e�\�@�����m����P195
	def get_tinjufukeiyou_table
		table = [
			[11, '�J���[�̂ɂ����̂���'],
			[12, '�₵���ȉ��y�̖苿��'],
			[13, '�ٗl�ȔM�C�ɕ�܂ꂽ'],
			[14, '�Î₪�x�z����'],
			[15, '�d������̂Ђ��߂�'],
			[16, '�^�����Ȗ��ɕ���ꂽ'],
			[22, '�N�����Ȃ�'],
			[23, '������Ƃ΂�ۂݍ��ނ悤��'],
			[24, '�ǂ���Ƃ���'],
			[25, '�S�n�悢��������'],
			[26, '������'],
			[33, '���łт���т����'],
			[34, '�����̏����������삯���'],
			[35, '�T�������J���~�葱��'],
			[36, '�����̔@��'],
			[44, '���̓���������'],
			[45, '�Ђ��Ђ��ƚ��������邷'],
			[46, '�������������邢'],
			[55, '���������̉��F����������'],
			[56, '���ނ������������ςݏグ��ꂽ'],
			[66, '�ǂ�����������'],
		]
		return get_table_by_d66_swap(table)
	end
 
	# ����{��i�\�@�����m����P195
	def get_tinjufujoukei_table
		table = [
			[11, '�v�[��'],
			[12, '��c��'],
			[13, '�|����'],
			[14, '�t�@�[�X�g�t�[�h'],
			[15, '����'],
			[16, '�H�n��'],
			[22, '�Ö���'],
			[23, '������'],
			[24, '�H��'],
			[25, '�a��'],
			[26, '���K�C��'],
			[33, '���̈ꎺ'],
			[34, '�O���E���h'],
			[35, '��̎�����'],
			[36, '�x�b�h'],
			[44, '�X���̉�'],
			[45, '����'],
			[46, '�a��'],
			[55, '���ޑq��'],
			[56, '�����{��'],
			[66, '�V��'],
		]
		return get_table_by_d66_swap(table)
	end
 
	# �C��`�e�\�@�����m����P195
	def get_kaiikikeiyou_table
		table = [
			[11, '����t����'],
			[12, '�r��͗l��'],
			[13, '�^�����Ȗ��ɕ���ꂽ'],
			[14, '�^����'],
			[15, '���E�����ς���'],
			[16, '�����Ɨh���'],
			[22, '�^���Ԃɐ��܂�'],
			[23, '�����Ɍ�����'],
			[24, '���܂��ɐ��܂��Ƃ���'],
			[25, '���L�����'],
			[26, '�ǂ��܂ł�����'],
			[33, '����₩�ȋC���ɂȂ�'],
			[34, '�M���M���Ɨs��'],
			[35, '�ɂ킩�ɂ͐M��������'],
			[36, '�����J�������t����'],
			[44, '�Â�'],
			[45, '�ł�'],
			[46, '�s�C���ȕ��͋C����������'],
			[55, '�R������'],
			[56, '�C�L�̐�����������'],
			[66, '�G�肪忂�'],
		]
		return get_table_by_d66_swap(table)
	end
 
	# �C���i�\�@�����m����P195
	def get_kaiikijoukei_table
		table = [
			[11, '凋C�O'],
			[12, '�Q��'],
			[13, '������'],
			[14, '���'],
			[15, '�����_'],
			[16, '���l�̑D'],
			[22, '��(�C�J�_)'],
			[23, '����'],
			[24, '�X���'],
			[25, '���e'],
			[26, '���̌Q��'],
			[33, '��'],
			[34, '�Y����'],
			[35, '�͖�'],
			[36, '��'],
			[44, '�}���O���[�u'],
			[45, '�n��'],
			[46, '��C��'],
			[55, '�C���J'],
			[56, '�D�̎c�['],
			[66, '�[�C����'],
		]
		return get_table_by_d66_swap(table)
	end
 
	#����C�x���g�\�@���C�m��P220
	def get_nichijyou_event_table
		table = [
			'�����Ȃ����X�F�u���[�����ދ��[�I�@��[�A�������悤�悧�v (�L�[���[�h)�ȊO�ɂ́A����Ƃ����ĕς�������Ƃ��Ȃ������ȓ��X�B�҂̂��d�����B �V�[���v���C���[�̂o�b�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́A�s�ҋ@�^�q�C7�t�Ŕ���B �B���F�V�[���v���C���[�̂o�b�́A�y�s���́z���ő�l�܂ŉ񕜂���B���ɍő�l�������ꍇ�A���̃Z�b�V�����̊ԁA�y�s���́z�̍ő�l��2�_�㏸���A���̒l�܂ŉ񕜂���B �c�O�F�V�[���v���C���[�̂o�b�́y�s���́z������(�[���؂�グ)�ɂȂ�B',
			'�e�B�[�^�C���F�uTea Time�͑厖�ɂ��Ȃ��ƃl�[�v �g���🹂�āA�e�B�[�^�C���̎��ԁB��i�ŗD������������Ă����B �V�[���v���C���[�̂o�b�́s�O����炵�^�w�i12�t�Ŕ���B �B���F�V�[���v���C���[�̂o�b�́A�y�s���́z��6�_�A�V�[���ɓo�ꂵ�Ă��邻��ȊO�̂o�b�́y�s���͂��z2�_�񕜂���B �c�O�F�o�b�S���́y�s���́z��2�_�������A�V�[���v���C���[�̂o�b�ɑ΂��āy����l�z��1�_�ȏ�l�����Ă���L�����N�^�[�S���́A���̐������Ƀ`�F�b�N������A�u����\�v�Ń����_���ɑ�����ύX����(�K���}�C�i�X��)�B',
			'�ނ�F�u�킧�I�@�務�務�I�v �ނ莅�𐂂�đ����]�Ƃ���ꍞ�ށB��H�@(�L�[���[�h)���ނꂽ���I�@ �V�[���v���C���[�̂o�b�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�����炩�^���i3�t�Ŕ���B �B���F�V�[���v���C���[�̂o�b�́A(�L�[���[�h)�Ɋ֘A����A�C�e���u�v���o�̕i�v���l������B �c�O�F�V�[���v���C���[�̂o�b�́y�s���́z��2�_�������A����{�̔R����1�c6��������B',
			'�����Q�F�u������Ƃ����A���x�݂��܂��v �����l�𗁂тĒ���{�ł������Ƃ����Q�B��������Ɩ����āA����ɔ����悤�I�@�V�[���v���C���[�̂o�b�́s�Q��^�2�t�Ŕ���B�B���F�o�b�S���́A������1�Ȃ��Ȃ�B�c�O�F�V�[���v���C���[�̂o�b�́A���̃T�C�N���̔��肷�ׂĂɃ}�C�i�X1�̏C�������B',
			'�Y��ɂ��������I�F�u�͂����B�e�L�p�L�ƕЕt�����Ⴂ�܂��傤�v �͓����ӊO�Ƃ��炩���Ă���B�Y��ɂ��Ȃ���I�@�����Ȃ��������̂��o�Ă��邩������Ȃ����c�c�B �V�[���v���C���[�̂o�b�́A�s�q���^�q�C11�t�Ŕ���B �B���F�V�[���v���C���[�̂o�b�́A�A�C�e���̒����烉���_����1��I�сA�����1�l������B �c�O�F�o�b�S���́A�D���ȃA�C�e������Ȃ����B',
			'�C�R�J���[�F�u�����̍ޗ����B���Ă��܂����B���܂˂��A���Ⴊ�����A�ɂ񂶂�A�Ɓv ��������؂�āA�݂�Ȃŗ����B���V�s�͊C�R�J���[(�L�[���[�h)���B����ρA�h����ˁB �V�[���v���C���[�̂o�b�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�H�ו��^�6�t�Ŕ���B �B���F�o�b�S���́y�s���́z��1�c6�_�񕜂���B �c�O�F�o�b�S���́y�s���́z��1�c6�_��������B',
			'�┈�^�M���o�C�F�u�����H����łȂ񂩂��Ȃ��悧�B�V���t���悧�v�┈�Ƃ͊C�R�̑���ł܂ݐH���̎��B��������Ǝ~�߂Ȃ���΁A�K���Ɋւ��B�V�[���v���C���[�̂o�b�́A�s�K���^�q�C5�t�Ŕ���B�B���F�V�[���v���C���[�̂o�b�́A���̃Z�b�V�����̊ԁA�y�s���́z�̍ő�l��2�_�㏸���A���̒l�܂ŉ񕜂���B�c�O�F����{�̂��ׂĂ̎��ނ�3����������B',
			'���X�̌P���F�u���R�̂��Ƃ������܂łł��B���ʂȕ]���Ȃ�āc�c�v���X�̌P����^�ʖڂɂ��Ȃ��B�s�f���^����2�t�Ŕ���B�B���F�V�[���v���C���[�̂o�b�́A�o���_��10�_�l������B�V�[���v���C���[�ȊO�̂o�b���烉���_����1�l��I�сA�V�[���v���C���[�ɑ΂���y����l�z��1�_�㏸����B�c�O�F�o�b�S���́y�s���́z��1�c6�_��������B',
			'��ށF�u�͑����A�����܂��˂��B�C���^�r���[�A����H�v(�L�[���[�h)�ɂ܂�鎖���Ɋւ��āA�V���ЂɎ�ނ����B�����L�������ĂˁB�V�[���v���C���[�̂o�b�͒���I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�����^�w�i3�t�Ŕ���B�B���F�V�[���v���C���[�̂o�b�ɑ΂��āy����l�z��1�_�ȏ㎝���Ă���L�����N�^�[�S���͂��́y����l�z��1�_�㏸������B�c�O�F�V�[���v���C���[�̂o�b�ɑ΂��āy����l�z��1�_�ȏ�l�����Ă���L�����N�^�[�S���́A���̐������Ƀ`�F�b�N������A�u����\�v�Ń����_���ɑ�����ύX����(�K���}�C�i�X��)�B',
			'�C�����F�u�C���Ă�����ˁ[�B�C���āv�N�₩�ȑ����C�B���̂��܂�̔������ɁA�v�킸��э��ށB�ǂځ[��I�@�s�ˌ��^�퓬6�t�Ŕ���B�B���F�o�b�S���́y�s���́z��2�_�񕜂���B�V�[���v���C���[�̂o�b�́A�A�C�e���̒����烉���_����1��I�сA�����1�l������B�c�O�F�V�[���v���C���[�̂o�b�͑�����1�󂯂�B���̂o�b�S���́y�s���́z��2�_��������B',
			'�}�C�u�[���F�u���V�E�}�@�I�v�����̓L�����������̂ł́c�c�B�悵�I�@(�L�[���[�h)���g���āA�V���ȃL�������m�����悤�I�@�V�[���v���C���[�̂o�b�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�������^�w�i6�t�Ŕ���B�B���F�V�[���v���C���[�̂o�b�́A���̃Z�b�V�����̊ԁA(�L�[���[�h)�Ɋւ��郍�[���v���C���s�����A�����(�L�[���[�h)�����Ē��邱�ƂŁy�s���́z��1�_�񕜂ł���B���̌��ʂ́A����{�t�F�C�Y�Ȃ�1�T�C�N����1��A�͑��풆�Ȃ�1���E���h��1��g�p�ł���B�c�O�F�V�[���v���C���[�̂o�b�ɑ΂��鑼�̂o�b�S���́y����l�z��1�_��������B',
		]
		return get_table_by_2d6(table)
	end
 
	#�𗬃C�x���g�\�@���C�m��P221
	def get_kouryu_event_table
		table = [
			'��G�����I�F�u�܍q��̎q�Ȃ񂩂ƈꏏ�ɂ��Ȃ��Łv���͂�(�L�[���[�h)���ۂ���C���Y���n�߂�B���͋C�������Ȃ��Ă��܂��ƁA���ꂩ��̎m�C�ɂ��e�����B�����͂ЂƂA���[�h��ς��Ȃ��ƁB�V�[���v���C���[�̂o�b�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�Ί�^����7�t�Ŕ���B�B���F�o�b�S���́A�D���ȃL�����N�^�[1�l�ɑ΂���y����l�z��1�_�㏸���邱�Ƃ��ł���B�c�O�F�o�b�S���́y�s���́z��3�_�������A�V�[���v���C���[�ɑ΂��āy����l�z��1�_�ȏ�l�����Ă���L�����N�^�[�S���́A���̐������Ƀ`�F�b�N������A�u����\�v�Ń����_���ɑ�����ύX����(�K���}�C�i�X��)�B',
			'���葫���F�u���A������A�����̔C���Ȃ̂ł����I�H�v2�l����Ŕ閧�̓��P�ł��B�V�[���v���C���[�̂o�b�́A�����ȊO�̍D���Ȃo�b1�l��I��ŁA�s�������^����11�t�Ŕ���B�B���F�V�[���v���C���[�̂o�b�ƑI�΂ꂽ�o�b�́A�����̎��D���Ȍ�1�𖢏C���̏�Ԃɂ��A�D���ȁy�����z1���l�����邱�Ƃ��ł���B�c�O�F�V�[���v���C���[�̂o�b�A�������́A�I�΂ꂽ�o�b�ɑ΂��āy����l�z��1�_�ȏ�l�����Ă���L�����N�^�[�S���́A���̐������Ƀ`�F�b�N������A�u����\�v�Ń����_���ɑ�����ύX����(�K���}�C�i�X��)',
			'���͐푈�F�u�����I�@�킢���I�@�����܂���I�v���Ȃ��̑O�Ɉ�l�͖̊��������B���Ȃ�����̃��C�o�����Ǝv���Ă���悤���B�ޏ��́u(�L�[���[�h)�ŏ����I�v�ƌ����Ă���̂����c�c�B�V�[���v���C���[�̂o�b�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�����^�12�t�Ŕ���B�B���F�V�[���v���C���[�̂o�b�́A�D���ȃL�����N�^�[1�l�ɑ΂���y����l�z��2�_�㏸����B�c�O�F�V�[���v���C���[�̂o�b�́A�y�s���l�z��2�_�������A�����́y����l�z�̐��������ׂĂɃ`�F�b�N������B',
			'�}�b�T�[�W�F�u�͂��c�c������܂��c�c���ӂł��ˁc�c�v���Ă���݂����Ȃ̂Ń}�b�T�[�W�B����ł�����Ƃ́A���C�ɂȂ邩�ȁH�@�V�[���v���C���[�̂o�b�́A�����ȊO�̍D���Ȃo�b1�l��I��ŁA�s���Ȃ��^����6�t�Ŕ���B�B���F�I�΂ꂽ�o�b�́A�V�[���v���C���[�̂o�b�ɑ΂���y����l�z��2�_�㏸���A[���݂̃V�[���v���C���[�̂o�b�ɑ΂���y����l�z�~2]�_�����A�����́y�s���́z���񕜂ł���B�c�O�F�V�[���v���C���[�̂o�b�ƑI�΂ꂽ�o�b�́y�s���l�z��2�_�������A�V�[���v���C���[�̂o�b�ɑ΂��āy����l�z��1�_�ȏ�l�����Ă���o�b�S���́A���̐������Ƀ`�F�b�N������A�u����\�v�Ń����_���ɑ�����ύX����(�K���}�C�i�X��)�B',
			'���̂������F�u�݂Ă݂ā`�A���̋P�����B�E�t�b�A�����Ƌ߂��Ō��Ă�v�ꏏ�ɂ����C�B���܂ɂ͗��̂����������������ˁH�V�[���v���C���[�̂o�b�́s�����^�11�t�Ŕ���B�B���F�V�[���v���C���[�̂o�b�ȊO�̂o�b�S���́A�V�[���v���C���[�̂o�b�ɑ΂���y����l�z��1�_�㏸����B�c�O�F�o�b�S���́y�s���́z��1�_�������A�V�[���v���C���[�̂o�b�ɑ΂��āy����l�z��1�_�ȏ�l�����Ă���o�b�S���́A���̐������Ƀ`�F�b�N������A�u����\�v�Ń����_���ɑ�����ύX����(�K���}�C�i�X��)',
			'�[��̃K�[���Y�g�[�N�F�u����Ȃɂ��b�������́[�H�@�悧�[���A�Ƃ��Ƃ�t���������Ⴄ��[�I�v�钆�ɏW�܂���(�L�[���[�h)�ɂ܂��K�[���Y�g�[�N�B�V�[���v���C���[�̂o�b�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s������ׂ�^�7�t�Ŕ���B�B���F�o�b�S���́A�D���ȃL�����N�^�[1�l�ɑ΂���y����l�z��1�_�㏸���邱�Ƃ��ł���B�c�O�F�o�b�S���́y�s���́z��1�c6�_��������B',
			'�����܂������F�u�͖��A�ǂ݂Â炭�Ȃ񂩁A�Ȃ���ˁH�@�ˁH�v��������A�ȒP�ȕ�����ǂ݂܂������Ă��܂��B�́A�͂��������c�c�B�V�[���v���C���[�̂o�b�́s�΂��^����8�t�Ŕ���B�B���F�V�[���v���C���[�ȊO�̂o�b�S���́A�V�[���v���C���[�̂o�b�ɑ΂���y����l�z��1�_�㏸����B�c�O�F�o�b�S���́y�s���́z��1�_�������A�V�[���v���C���[�̂o�b�ɑ΂��āy����l�z��1�_�ȏ�l�����Ă���o�b�S���́A���̐������Ƀ`�F�b�N������A�u����\�v�Ń����_���ɑ�����ύX����(�K���}�C�i�X��)�B',
			'�����S��莜���̈��F�u���������A�����Ǝ��ɗ����Ă����̂�v�����̋���@���āA�s����������҂��Â�������B���̕ꐫ�ɂ���āA�����Ƒ���͈��炮�͂����B�V�[���v���C���[�̂o�b�́A�����ȊO�̍D���Ȃo�b1�l��I��ŁA�s�ʓ|���^���i4�t�Ŕ���B�B���F�I�΂ꂽ�o�b�́A�V�[���v���C���[�̂o�b�ɑ΂���y����l�z��1�_�㏸���A[���݂̃V�[���v���C���[�̂o�b�ɑ΂���y����l�z�~2]�_�����A�����́y�s���l�z���񕜂ł���B�c�O�F�V�[���v���C���[�̂o�b�ƑI�΂ꂽ�o�b�́A�y�s���́z��1�c6�_��������B',
			'��������F�u�����ɂ��܂��傤���v������̓��Ԃ�(�L�[���[�h)����������Ɏ����Ă����B�V�[���v���C���[�̂o�b�́A�����ȊO�̍D���Ȃo�b1�l��I��ŁA����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�D�����^����4�t�Ŕ���B�B���F�V�[���v���C���[�̂o�b�́A�I�񂾂o�b�ɑ΂���y����l�z��1�_�㏸����B�I�΂ꂽ�o�b�́A(�L�[���[�h)�Ɋ֘A����A�C�e���u�v���o�̕i�v���l������B�c�O�F����{�̔R����1�c6��������B',
			'���莆�F�u���莆���͂��Ă���N�}�v���i�����Ȃ��悤�ȋC�������莆�ɂ������߂Ă݂悤�B�͂����ȁB���̋C�����B�V�[���v���C���[�̂o�b�́A�����ȊO�̍D���Ȃo�b1�l��I��ŁA�s�Õ��^�w�i5�t�Ŕ���B�B���F�I�΂ꂽ�o�b�́A�V�[���v���C���[�̂o�b�ɑ΂���y����l�z��2�_�㏸����B�c�O�F�V�[���v���C���[�̂o�b�́A����Ɏg�p���������y�����z�Ȃ�A������y��_�z�ɕύX����B',
			'�̌��F�u���A����H�@����͂�����Ɛς݂����Ȃ��Ȃ��c�c�v(�L�[���[�h)�ɂ܂��h���ߋ���b���B����Șb���������Ȃ����Ȃ��B�V�[���v���C���[�̂o�b�́A�����ȊO�̍D���Ȃo�b1�l��I��ŁA����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�Â��ߋ��^�w�i4�t�Ŕ���B�B���F�V�[���v���C���[�̂o�b�ƑI�΂ꂽ�o�b�́A�݂��ɑ΂���y����l�z��1�_�㏸����B�c�O�F�o�b�S���́y�s���́z��2�_�������A�V�[���v���C���[�ɑ΂��āy����l�z��1�_�ȏ�l�����Ă���o�b�S���́A���̐������Ƀ`�F�b�N������A�u����\�v�Ń����_���ɑ�����ύX����(�K���}�C�i�X��)�B',
		]
		return get_table_by_2d6(table)
	end
 
	#�V�уC�x���g�\�@���C�m��P222
	def get_asobi_event_table
		table = [
			'�V�т̂��肪�c�c�F�u�J�́A�����~�ނ��v(�L�[���[�h)�ɖ����ɂȂ邠�܂�A���̊Ԃɂ��A�͑��̒��Ԃƌ����ɁA�݂�Ȃ͋����Ă���邾�낤���B�����āA�����݂͂�Ȃ�������̂��낤���H�@�V�[���v���C���[�̂o�b�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s����₩�^����9�t�Ŕ���B�B���F�o�b�S���́A�����̂��ׂẮy����l�z�̐������̃`�F�b�N�������B�c�O�F�V�[���v���C���[�̂o�b�ɑ΂��āy����l�z��1�_�ȏ�l�����Ă���L�����N�^�[�S���́A���̐������Ƀ`�F�b�N������A�u����\�v�Ń����_���ɑ�����ύX����(�K���}�C�i�X��)',
			'�V�����V�т̊J���F�u�͂��H�@������H�@�V�����V�т��ۂ��H�v�ҋ@���Ԓ��ɁA�ɂ�ׂ���V�т��l�Ă��Ă����B�V�[���v���C���[�̂o�b�́A�s��z�^�3�t�Ŕ���B�B���F�V�[���v���C���[�̂o�b�́A�y��_�z��1�y�����z�ɕύX�ł���B����{�̍D���Ȏ��ނ�3������B�c�O�F�V�[���v���C���[�̂o�b�́A�y�����z�̌���1�I��Ły��_�z�ɂ���B',
			'����F�u�����������̊����I�@�A�Q�A�Q�ōs���܂���I�v�݂�ȂŐH�ו�����ݕ���(�L�[���[�h)����������Ă͂��Ⴎ�B�剃��I�@�V�[���v���C���[�̂o�b�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s���C�^���i7�t�Ŕ���B�B���F�V�[���v���C���[�ȊO�̑S���́A�V�[���v���C���[�̂o�b�ɑ΂���y����l�z��1�_�㏸����B�c�O�F�o�b�S���́y�s���́z��1�c6�_�������A�V�[���v���C���[�̂o�b�ɑ΂��āy����l�z��1�_�ȏ�l�����Ă���o�b�S���́A���̐������Ƀ`�F�b�N������A�u����\�v�Ń����_���ɑ�����ύX����(�K���}�C�i�X��)',
			'�X���Ԃ���F�u�z���A�x�e����܁[���v�͖������ăt���[�̎��Ԃ͂���B�X�ɏo�ĂԂ���Ă݂���V�������������邩���B�V�[���v���C���[�̂o�b�́A�s�ʔ����^����10�t�Ŕ���B�B���F�V�[���v���C���[�̂o�b�́A�A�C�e���u�A�C�X�v��1�l������B����{�̍D���Ȏ��ނ�3������B�c�O�F�V�[���v���C���[�̂o�b�́y�s���́z������(�[���؂�グ)�ɂȂ�B',
			'�K�[���Y�R�[�f�F�u����c�c��������Ƃ��댩�Ȃ��ł�ˁI�v�͖������ď��̎q�I�@�����ȃR�[�f�𒅂��Ȃ�������ˁI�@�V�[���v���C���[�̂o�b�́A�s�������^�10�t�Ŕ���B�B���F�V�[���v���C���[�̂o�b�́A�A�C�e���u�J�����ށv��1�l�����A�����ȊO�̍D���Ȃo�b1�l�ɑ΂���y����l�z��1�_�㏸������B�c�O�F����{�̍|�ނ�2�c6��������B',
			'�������J�ÁI�F�u�ς�ς��ρ[����I�v�Ȃ�̈��ʂ��A(�L�[���[�h)�ɂ܂��������͂߂ɁB��邩��ɂ́A�������Ȃ��I�@�V�[���v���C���[�̂o�b�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s��_�^���i12�t�Ŕ���B�B���F�V�[���v���C���[�̂o�b�́A(�L�[���[�h)�Ɋ֘A����A�C�e���u�v���o�̕i�v���l������B�c�O�F�o�b�S���́y�s���́z��1�c6�_�������A����{�̒e��1�c6��������B',
			'�`�F�X�����F�u�t�b�A�����Łc�c�V��ŗ~�����̂����H�v�@2�l�Ń`�F�X���w���B�V�[���v���C���[�̂o�b�́A�����ȊO�̍D���Ȃo�b1�l��I��ŁA�s�N�[���^����3�t�Ŕ���B�B���F�V�[���v���C���[�̂o�b�ƑI�΂ꂽ�o�b�́A�݂��ɑ΂���y����l�z��1�_�㏸���A�y�s���́z��1�c6�_�񕜂���B�c�O�F�V�[���v���C���[�̂o�b�ƑI�΂ꂽ�o�b�́A�y�s���́z��1�c6�_�������A�݂��ɑ΂���y����l�z�̐������Ƀ`�F�b�N������A�u����\�v�Ń����_���ɑ�����ύX����(�K���}�C�i�X��)�B',
			'�M���J���I�P���F�u�}�C�N���ʑ��v�H�@�`�F�b�N1�A2�c�c�A�悵�v�݂�Ȃňꏏ�ɃJ���I�P���B�����́A�����̂������ȁ[�H�@�V�[���v���C���[�̂o�b�́A�s�|�\�^�9�t�Ŕ���B�B���F�V�[���v���C���[�̂o�b�́A�A�C�e���u�r㻁v��1�l�����A�����́y����l�z�̂��ׂĂ̐����̃`�F�b�N�������B�c�O�F�o�b�S���́A������1�󂯂�B',
			'�A�C�h���R���T�[�g�F�u�߉ς����Z���^�[�I�@��Ԃ̌�����ł��I�v�Ԗ�R���T�[�g���͖������ł�邱�ƂɂȂ����B���ő҂݂�Ȃ̐S����|�ŗE�C�Â��悤�I�@�V�[���v���C���[�̂o�b�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�A�C�h���^�w�i8�t�Ŕ���B�B���F�V�[���v���C���[�̂o�b�ɑ΂��āy����l�z��1�_�ȏ㎝���Ă���o�b�S���́A���́y����l�z��1�_�㏸���A���������R�ɕύX�ł���B�c�O�F�V�[���v���C���[�̂o�b�ɑ΂��鑼�̂o�b�S���́y����l�z��1�_��������B�V�[���v���C���[�̂o�b�́A�g�p���������y�����z�������ꍇ�A������y��_�z�ɕύX����B',
			'�X�^�C�������I�F�u�����C�͑�D���[�I�@�ӂӁ`��v�������ɃX�^�C���������n�܂�B�V�[���v���C���[�̂o�b�́A�s�X�^�C���^�w�i11�t�Ŕ���B�B���F�V�[���v���C���[�̂o�b�́A�A�C�e���u�����C���܁v��1�l�����A�����ȊO�̍D���Ȃo�b1�l�ɑ΂���y����l�z��1�_�㏸������B�c�O�F�o�b�S���́y�s���́z��1�c6�_��������B�V�[���v���C���[�̂o�b�́A�g�p���������y�����z�������ꍇ�A������y��_�z�ɕύX����B',
			'�����Ɩʓ|�݂邩��I�F�u�A���C�����A�ꏏ�ɍs����v�ŋ߁A�����ȃ}�X�R�b�g����l�C�B(�L�[���[�h)���y�b�g�ɂ���̂����s��B�V�[���v���C���[�̂o�b�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�������^�4�t�Ŕ���B�B���F�V�[���v���C���[�̂o�b�́A�A�C�e���u���}�C���v���v��1�l������B�c�O�F����{�̎��ނ����ׂ�3��������B',
		]
		return get_table_by_2d6(table)
	end
 
	#���K�C�x���g�\�@���C�m��P223
	def get_ensyuu_event_table
		table = [
			'�傰�񂩁I�F�u���ʒ��ł����āc�c�H�@��k����Ȃ���I�v���K���A(�L�[���[�h)�������āA�������Ȏ����痐�����n�܂�B�V�[���v���C���[�̂o�b�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�����������^���i6�t�Ŕ���B�B���F�o�b�S���́y����l�z�̂��ׂĂ̐����̃`�F�b�N�������B�o�b�����̊͑����̈ꕔ���u�L�[���[�h�v�ɕύX����B�c�O�F�o�b�S���͑�����1�󂯂�B',
			'�������K�F�u40��̋����͈ɒB����Ȃ�����v������̌P����ς�ŁA����ɔ�����B�V�[���v���C���[�̂o�b�́A�s�����^�퓬10�t�Ŕ���B�B���F�V�[���v���C���[�̂o�b�́A���̃Z�b�V�����̊ԁA�����\�́u�����v�̂��������A�r���e�B���C�����Ă����ꍇ�A���́u�����v�̒l��1�_�㏸����(���̌��ʂ͗ݐς��Ȃ�)�B���s�F����{�̒e��ƔR����1�c6����������B',
			'���w�̍u�`�F�u�񂣁c�c�͂��I�@���ł���!?�@�Q�Ă܂���I�@�Q�Ă܂���Ă΂��[���I�v������(�L�[���[�h)�Ɋւ�����ʍu�`�B�ł��c�c���傤�����c�c�B�V�[���v���C���[�̂o�b�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�}�W���^���i5�t�Ŕ���B�B���F�V�[���v���C���[�̂o�b�́A���̃Z�b�V�����̊ԁA(�L�[���[�h)�Ɋւ��锻����s���ꍇ�A�����2�c6��U��O�Ɂy�s���́z��1�_�����ƁA�v���X1�̏C�������邱�Ƃ��ł���(���̌��ʂ͗ݐς��Ȃ�)�B�c�O�F�o�b�S���́y�s���́z��1�c6�_��������B',
			'���͉��K�F�u���ɂ͒N���ǂ����Ȃ���[�v�������ƕ��̔@���B���͂𗘗p�����A�f���������𓾂邽�߂ɌP������B�V�[���v���C���[�̂o�b�́A�s�@���^�q�C8�t�Ŕ���B�B���F�V�[���v���C���[�̂o�b�́A���̃Z�b�V�����̊ԁA�y���́z��1�_�㏸����(���̌��ʂ͗ݐς��Ȃ�)�B�c�O�F����{�̔R����6��������B',
			'�~�����K�F�u�푈�ɂ͏����������ǁA���͏����������āA���������ł����H�v�����������A���̐�������邱�Ƃ����ɂ������P���B�V�[���v���C���[�̂o�b�́A�s�x���^�퓬9�t�Ŕ���B�V�[���v���C���[�̂o�b�́A�o���_��10�_�l������B�c�O�F�o�b�S���́y�s���́z��1�c6�_��������B',
			'�C�����K�F�u10��̎�C�͈ɒB����Ȃ����I�v(�L�[���[�h)���g���āA�C����̌P�����s�����B�V�[���v���C���[�̂o�b�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�C���^�퓬7�t�Ŕ���B�B���F�V�[���v���C���[�̂o�b�́A���̃Z�b�V�����̊ԁy�����́z��1�_�㏸����(���̌��ʂ͗ݐς��Ȃ�)�B�c�O�F����{�̒e��2�c6��������B',
			'�͑��퉉�K�F�u�����āc�c�����o�Ă���́H�v�ʂ̒���{�Ƃ��݂��̊͑����Ԃ�������K�͂ȉ��K�B�V�[���v���C���[�̂o�b�́A�s�h��^����12�t�Ŕ���B�B���F�V�[���v���C���[�̂o�b�́A���̃Z�b�V�����̊ԁA�y�Ήz��1�_�㏸����(���̌��ʂ͗ݐς��Ȃ�)�B�c�O�F����{�̒e��ƍ|�ނ�1�c6��������B',
			'�������K�F�u�����p���y�q��(�X�p�X�B�[�o)�v�e�͑����琮�����K�v�Ȋ͂𐔊̓h�b�N���肳���A��K�͂Ȑ��������悤�I�@�V�[���v���C���[�̂o�b�́A�s�����^�q�C12�t�Ŕ���B�B���F�V�[���v���C���[�̂o�b�́A���̃Z�b�V�����̊ԁA�y���b�́z��1�_�㏸����(���̌��ʂ͗ݐς��Ȃ�)�B�c�O�F�o�b�S���́y�s���́z��1�c6�_��������B�V�[���v���C���[�̂o�b�́A�g�p���������y�����z�������ꍇ�A������y��_�z�ɕύX����B',
			'��퉉�K�F�u�����B���Ɩ�킵��I�v���ɔ����āA��̌P��������B����Ȗ��Ŗ𗧂͈̂ӊO��(�L�[���[�h)�H�@�V�[���v���C���[�̂o�b�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s���^�퓬12�t�Ŕ���B�B���F�V�[���v���C���[�̂o�b�́A���̃Z�b�V�����̊ԁA��펞�Ɂy�����́z�Ɓy�Ήz��1�_���㏸����B(���̌��ʂ͗ݐς��Ȃ�)�c�O�F�o�b�S���́y�s���́z��1�c6�_��������B',
			'�J�����K�F�u�����c�c�������ς肻���v���܂��H�@�����ɕ����A�܂���肻����ˁB����c�c�v�H���ŐF�X�ȉ������s���A��͂𑝋����悤�I�@�V�[���v���C���[�̂o�b�́A�s�閧����^�w�i9�t�Ŕ���B�B���F�V�[���v���C���[�̂o�b�́A���̃Z�b�V�����̊ԁA�y�����́z��1�_�㏸����(���̌��ʂ͗ݐς��Ȃ�)�B�c�O�F����{�̍|�ނƃ{�[�L�T�C�g��5����������B',
			'�h��ˌ����K�F�u�΋�Ί���ŐV����B�K���K���������Ă�����Ⴂ�I�v(�L�[���[�h)���󂩂�~���Ă���B���x�����A������g���đ΋󉉏K���B�V�[���v���C���[�̂o�b�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�΋�퓬�^�퓬5�t�Ŕ���B�B���F�V�[���v���C���[�̂o�b�́A���̃Z�b�V�����̊ԁA�����\�͂��u�΋�v�u���΋�v�̂��������A�r���e�B���C�����Ă����ꍇ�A���́u�΋�v�u���΋�v�̒l��1�_�㏸����(���̌��ʂ͗ݐς��Ȃ�)�B�c�O�F����{�̒e��ƔR����1�c6����������B',
		]
		return get_table_by_2d6(table)
	end
 
	#�����C�x���g�\�@���C�m��P224
	def get_ensei_event_table
		table = [
			'��̐[�C���͂��瓦����I�F�u�G�͑������I�@�C��A�p�ӂ��āI�v�D�c��q���ɁA(�L�[���[�h)�̂悤�Ȏp�������A��̐[�C���͂ɏP����B�D�c�̐l���������ł������Ă����Ȃ��ƁB�V�[���v���C���[�̂o�b�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�ދp�^�퓬8�t�Ŕ���B�B���F�V�[���v���C���[�̂o�b�́A(�L�[���[�h)�Ɋ֘A����A�C�e���u�v���o�̕i�v���l������B�c�O�F�o�b�S���́y�s���́z��2�_�������A�V�[���v���C���[�̂o�b�͑�����1�󂯂�B',
			'�����A���C���F�u���d���ł��ˁI�v����������A������鎑�����`�֌�q���A�����A�����������悤�I�@�V�[���v���C���[�̂o�b�́A�s�������^�8�t�Ŕ���B�B���F����{�̒e��ƍ|�ނ�6������B�c�O�F�o�b�S���́y�s���́z��1�c6�_�������A����{�̔R���ƒe��3��������B',
			'���s��@�C���F�u��Ԑ�ɁA�G�͔����I�v(�L�[���[�h)�ɋU�������A�G�͑��𔭌��B���������߂Â��΁A�A���̏�񂪕����邩���B�V�[���v���C���[�̂o�b�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s���G�^�q�C4�t�Ŕ���B�B���F���ɑ�������G�͑��̕Ґ��Ɗ��͂̃f�[�^�����狳���Ă��炦��B�c�O�F�V�[���v���C���[�̂o�b�͑�����1�󂯁A����{�̔R����1�c6��������B',
			'�q��@�A�����F�u�����A�������撣���ăA�E�g�����W����I�v�L�͂ȁu�q���́v������z�������͑���Ґ��A�O���ɍq��@��A������I�@�V�[���v���C���[�̂o�b�́A�s�q���^�퓬4�t�Ŕ���B�B���F����{�̍|�ނ�2�c6������B�c�O�F�o�b�S���́y�s���́z��1�c6�_�������A����{�̃{�[�L�T�C�g����5��������B',
			'�^���J�[��q�C���F�u�w�`��ۂ��A�Ջ@���ςɁA�s����I�v���c�n�т���R���𖞍ڂ��Ė߂�^���J�[�D�c����q���悤�I�@�V�[���v���C���[�̂o�b�́A�s���J�^���i9�t�Ŕ���B�B���F����{�̔R����2�c6������B�c�O�F�o�b�S���́y�s���́z��1�c6�������A����{�̔R����3��������B',
			'�C���q�C���F�u���̌̋��ŃR�������s���Ă��ł����āv�A���D�c�̈��S��}�邽�߂ɁA�D�c�ɓ��s���āA�������q���悤�I�@�ǂ���炱�̗A���D�c��(�L�[���[�h)���^��ł���悤���B���܂���邽�߂ɂ́A(�L�[���[�h)�ɑ΂��闝����[�߂˂΁B�V�[���v���C���[�̂o�b�́A����I��(�L�[���[�h)�ɑΉ������w��\�͂Ŕ���B�v�����Ȃ��ꍇ�́s�s�v�c�^���i2�t�Ŕ���B�B���F����{�̒e��ƍ|�ނ�6������B�c�O�F�o�b�S���́y�s���́z��1�c6�������A����{�̔R���ƒe��3����������B',
			'�ϊ͎��F�u�ǂ���I�@�ˁA�c�c�����ہA���ĂĂ��ꂽ�H�v�����������̌P���̐��ʂ�������Ƃ��I�@�u�ϊ͎��v�����s���悤�I�@�V�[���v���C���[�̂o�b�́A�s�����Ƃ₩�^����5�t�Ŕ���B�B���F����{�̒e��2�c6������B�c�O�F�o�b�S���́y�s���́z��1�c6�_�������A����{�̔R����5��������B',
			'�{�[�L�T�C�g�A���C���F�u�⋋�͑�؂����H�v�����W�ϒn�����`�ɁA�{�[�L�T�C�g��A�����悤�I�@�V�[���v���C���[�̂o�b�́A�s�⋋�^�q�C6�t�Ŕ���B�B���F����{�̃{�[�L�T�C�g��1�c6������B�c�O�F�o�b�S���́y�s���́z��1�c6�_�������A����{�̔R����5��������B',
			'�Ќ��E�f�r���[�H�F�u��l�O�̃��f�B�[�Ƃ��Ĉ����Ă�ˁI�v��̑㗝�ŁA�Z���u�Ȑl�������W�܂�(�L�[���[�h)�Ɋւ���p�[�e�B�[�ɏo�ȁB�p�������Ȃ��悤�ɂ��Ȃ��ƁB�V�[���v���C���[�̂o�b�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s����l�^�w�i10�t�Ŕ���B�B���F�D���Ȏ��ނ�2�c6������B�c�O�F�o�b�S���́y�s���́z��1�c6�_��������B�V�[���v���C���[�̂o�b�́A�g�p���������y�����z�������ꍇ�A������y��_�z�ɕύX����B',
			'�ΐ��x���C���F�u��������A�o�����܂��v���������Ґ����A�̊C�������G�A�ΐ��x���C���ɂ����I�@�V�[���v���C���[�̂o�b�́A�s�ΐ��퓬�^�퓬11�t�Ŕ���B�B���F�V�[���v���C���[�̂o�b�́A�u�����C���܁v���l������B�c�O�F�o�b�S���́y�s���́z��1�c6�_�������A����{�̔R���ƍ|�ނ�3����������B',
			'��K�͉������A���߁I�F�u�t�t�t�A�|�����H�v��K�͂ȉ������s���A�͑��^�c�ɖ𗧂�(�L�[���[�h)���m�ۂ��悤�I�@�V�[���v���C���[�̂o�b�́A��̑I��(�L�[���[�h)�ɑΉ������w��\�͒l�Ŕ���B�v�����ȏꍇ�́s�w���^�q�C10�t�Ŕ���B�B���F����{�̂��ׂĂ̎��ނ�1�c6������B�c�O�F����{�̂��ׂĂ̎��ނ�1�c6��������B',
		]
		return get_table_by_2d6(table)
	end
 
	#���C�x���g�\�@���C�m��P225
	def get_sakusen_event_table
		table = [
			'�d�q�̖ځF�u�܏\��ɂ͊ی�����H�v�ŐV��(�L�[���[�h)�Z�p�œG�͑��̈ʒu��c���B�V�[���v���C���[�̂o�b�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�d�q��^�퓬2�t�Ŕ���B�B���F���̊͑���̊ԁA�G�͑����ׂẮy���b�́z��1�_�������邱�Ƃ��o����(���̌��ʂ͗ݐς��Ȃ�)�B�c�O�F���̊͑���̊ԁA�G�͑����ׂẮy�Ήz��1�_�㏸����B',
			'���������F�u�΋󌩒�������Ƃ��āB��낵���˂��I�v�G�̋�P���x�����A�����������グ��B�V�[���v���C���[�̂o�b�́s�q���^�퓬4�t�Ŕ���B�B���F���̊͑���ŁA�G�̑����\�́u�q��U���v�̐������A���ׂ�1�Ⴂ���̂Ƃ��Ĉ���(���̌��ʂ͗ݐς��Ȃ�)�B�c�O�F����{�̃{�[�L�T�C�g��2�c6��������B',
			'�\�ɂ��΁F�u�c�c�C�ɂȂ��ł������H�@������񂠂�܂��悧�H�v����{��(�L�[���[�h)�Ɋւ���A��ȉ\����ь����Ă���B����������ƁA����̔C���Ɋ֌W���H�@�V�[���v���C���[�̂o�b�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�ʐM�^�q�C3�t�Ŕ���B�B���F�u���ɑ�������G�͑��̕Ґ��Ɗ��̓f�[�^�v�A�������́u���ɋN����V�i���I�C�x���g�̃^�C�~���O�Ƃ����܂��ȓ��e(�ǂ̂��炢��܂����́A����f)�v�����狳���Ă��炦��B�c�O�F�V�[���v���C���[�̂o�b�͍D���ȁy�����z���y��_�z�ɕύX����B',
			'�������ɂāF�u���̍��C��̎����A�����Ă�����Ă����ł����H�v���Ɏ������L���ĊC�}��T��B�G�ɑ�������Ƃ����炱�̂�����c�c�H�@�V�[���v���C���[�̂o�b�́A�s�C�}�^�q�C9�t�Ŕ���B�B���F���̃Z�b�V�����̊ԁA��x�����A�����w�肳�ꂽ��ꂪ�C�ɓ���Ȃ������ꍇ�A�u���\�v����x�g�p���āA�����_���ɑI�񂾐��ɕύX���邱�Ƃ��ł���B�c�O�F���̊͑���̑������A��́A�����u�s����(�s��)�v�ɂ��邱�Ƃ��ł���B',
			'���V�g�F�u�K�^�̏��_�̃L�X���������Ⴂ�܂��v�ڂɌ����Ȃ��͂Ɏ���Ă���̂�������c�c���̗\����M���Đi�߁I�@�V�[���v���C���[�̂o�b�́A�s�K�^�^�w�i7�t�Ŕ���B�B���F�V�[���v���C���[�̂o�b�́A�A�C�e���u���}�C���v���v��1�l������B�c�O�F�V�[���v���C���[�̂o�b�́y�s���́z��2�c6�_��������B',
			'����c�I�F�u����c�ł��傤���H�v(�L�[���[�h)�ɂ��Ă̏d��ȃ~�[�e�B���O�B���̉�c�̍s�����A�킢�����E����ƌ����Ă��ߌ��ł͂Ȃ��B�V�[���v���C���[�̂o�b�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s���R�z���^���i11�t�Ŕ���B�B���F�V�[���v���C���[�̂o�b�́A�I��(�L�[���[�h)�Ɋ֘A��������y�����z�Ƃ��Ċl���ł���(���̍ő吔�𒴂��邱�Ƃ͏o���Ȃ�)�B�c�O�F�V�[���v���C���[�̂o�b�ɑ΂��āy����l�z��1�_�ȏ�l�����Ă���L�����N�^�[�S���́A���̐������Ƀ`�F�b�N������A�u����\�v�Ń����_���ɑ�����ύX����(�K���}�C�i�X��)',
			'�Í���ǁF�u�����Í��ʐM��B���e��ǂ݂Ȃ����v�Í��ɂ���ē͂���ꂽ�閧�̎w�߂���ǂ��Ă����B�Í���ǂ݉������Ƃ��A�킢�̌�������B�s�Í��^�q�C2�t�Ŕ���B�B���F���̊͑���̑������A�G��1�l��ڕW�ɑI�Ԃ��Ƃ��ł���B�u���b�g���A�ڕW�͂��̃v���b�g�����J���Ȃ���s��Ȃ���΂Ȃ�Ȃ��B�c�O�F���̊͑���̃v���b�g���A��́A�I�񂾂o�b1�l�̃v���b�g���������茩���Ă��炤���Ƃ��ł���B',
			'�ꂩ�����H�F�u�����邯�那�I�v�������ɁA���̍��Ȃ炢�����������c�c�B�M���āA���̍��ɓq���Ă݂�ׂ����H�@�V�[���v���C���[�̂o�b�́s�y�ϓI�^���i8�t�Ŕ���B�B���G���̊͑���̊ԁA��x�����A���E���h�̏I�����ɖ����͂�1�l�A�D���ȍq�s����ɔz�u���������Ƃ��ł���B�c�O�F���̊͑���̊ԁA���ׂĂ̂o�b�́A�t�@���u�������ꍇ�A�u�A�N�V�f���g�\�v��2��g�p���Ȃ���΂Ȃ�Ȃ��B',
			'�����@�ւƂ��琁F�u�d���͂��Ă�݂�����H�v(�L�[���[�h)�Ɋւ���ʔ�����񂪓͂����B�M���Ă������̂��B�ЂƂA��������Ă݂邩�B�V�[���v���C���[�̂o�b�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�l���^�w�i2�t�Ŕ���B�B���F���̃Z�b�V�����̊ԁA��x�����A�G�͑����g�p���鑕���\�͂𖳌����ł���B�c�O�F�o�b�S���́A�u�A�N�V�f���g�\�v���g�p����(2�Ԃ̌��ʂ����������ꍇ�A�V�[���v���C���[�́A���̃C�x���g�Ŏg�p�������̑������ύX�����B����ȊO�̂o�b�́A2�Ԃ̌��ʂ𖳎����Ă悢)�B',
			'�N�C�[���Y�E�M�����r�b�g�F�u�o����I���āA�ǂ��o�Ă��邩����H�v���̕z�w�Ȃ�A����̓����������ł��邩���B�V�[���v���C���[�̂o�b�́A�s�������^���i10�t�Ŕ���B�B���F���̊͑���̑������A1�`6�̐����̒�����A�D���Ȑ�����1�I�ԁB�G�͂́A���̍q�s����Ƀv���b�g���邱�Ƃ��ł��Ȃ��Ȃ�B�c�O�F���̊͑���̊ԁA�o�b�S���́y���́z��1�_��������B',
			'�m�ޒm�ȎҁA�S��s�w�F�u������������Ďg���̂��A�ց[���v�ߋ��̊C��̎�������G�̐�͂𕪐́B�V�[���v���C���[�̂o�b�́A�s�Ǐ��^�5�t�Ŕ���B�B���F���̊͑���̊ԁA�G�͑��̂��ׂẮy���́z��1�_�������邱�Ƃ��ł���(���̌��ʂ͗ݐς��Ȃ�)�B�c�O�F���̊͑���̊ԁA�G�͑����ׂẮy�Ήz��1�_�㏸����B',
 
		]
		return get_table_by_2d6(table)
	end
 
#�ǉ��C�x���g�\
	#�ق̂ڂ̃C�x���g�\�@�����m����P134
	def get_honobono_event_table
		table = [
			'�͗l�ւ��F�u�����A�傰���ł͂Ȃ��ł��傤���H�v����{���Ȃ񂾂��E���i��(�L�[���[�h)�ŏ�����悤�B�V�[���v���C���[��PC�́A��̑I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�h��^����12�t�Ŕ���B�B���F���̃Z�b�V�����̊ԁAPC���Ƌ���g�p����Ƃ��Ƀv���X1�̏C�������B�c�O�F����{�̍D���Ȏ��ނ�1��������B',
			'����j��F�u�������قǂɂȁv�O�o��ł��b�����݁A�������������߂��Ă��܂����B����A��������Ė߂낤������H�@�V�[���v���C���[��PC�́A�����ȊO��PC����1�l��I�сA�s���^�퓬12�t�Ŕ���B�B���F�V�[���v���C���[��PC�ƑI�΂ꂽPC�́A�݂��ɑ΂���y����l�z�̃`�F�b�N�������B�c�O�F�V�[���v���C���[��PC�ƑI�΂ꂽPC�́A�y�s���́z��1�_��������B',
			'�ڂ₫���F�u����ȂɂȂ�܂ŃR�L�����₪���āA�N�\���I�v(�L�[���[�h)�ɂ��Ă̋�s�ɉԂ��炭�B�V�[���v���C���[��PC�́A��̑I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�������^���i10�t�Ŕ���B�B���FPC�S���́A�������}�C�i�X�̑����́y����l�z�������Ă���PC�̐l���Ɠ����l�����A�����́y�s���́z���񕜂���B�c�O�F�V�[���ɓo�ꂵ�Ă��Ȃ�PC�́A�����́y�s���́z��1�_��������B',
			'�������c�c�F�u���̎��̐l������������̂Ȃ�A�R�͂���Ȃ����Ă̂����������ˁv�푈���I�������̂��Ƃɂ��āA�Ƃ�Ƃ߂�������荇���B�V�[���v���C���[��PC�́s���R�z���^���i11�t�Ŕ���B�B���FPC�S���́y�s���́z��1�_�񕜂���B�c�O�F�V�[���v���C���[��PC�́A�\��������s���B',
			'�ދ��ȉ�c�F�u�A���݂����B�����뉽����`�H�v�ދ��ȉ�c���A�͖����m��������莆���񂷁B�V�[���v���C���[��PC�́A�V�[���ɓo�ꂵ�Ă��鎩���ȊO��PC����l�I�сs�Í��^�q�C2�t�Ŕ���B�B���F�V�[���v���C���[��PC�ƑI�΂ꂽPC�́A�݂��ɑ΂���y����l�z�̐������̃`�F�b�N�������B�c�O�F�V�[���v���C���[��PC�ƑI�΂ꂽPC�́A�y�s���́z��1�_��������B',
			'�C�̍�����F�u���������Ă��A�G�S����񂾂�`�H�v(�L�[���[�h)�����������ɁA���͂Ƌ��ʂ̎�𔭌��B�V�[���v���C���[��PC�́A�����ȊO�̍D����PC��1�l�I�сA��̑I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�ʔ����^����10�t�Ŕ���B�B���F�V�[���v���C���[�ƑI�΂ꂽPC�́A���ꂼ��D���Ȍ����P�I��Ŗ��C����Ԃɂ��A�����y�����z���C�����邱�Ƃ��ł���B�c�O�F�V�[���v���C���[��PC�ƑI�΂ꂽPC�́A�݂��ɑ΂���y����l�z�̐������Ƀ`�F�b�N������B',
			'�g�����Ȃ݁F�u���Ȃ��ŁA���Ȃ��Ł`�v�Q�N���̖��f�����p�ŏo�����̂��A���R�����Ă��܂����B���A�Q�Ă����X�Ƃ��Ă�΂�����ˁH�V�[���v���C���[��PC�́A�����ȊO��PC�������_����1�l�I�сA�s����₩�^����9�t�Ŕ���B�B���F�I�΂ꂽPC�́A�V�[���v���C���[�ɑ΂���y����l�z��1�_�㏸������B�c�O�F�V�[���v���C���[��PC�ɑ΂���A�I�΂ꂽPC�́y����l�z�̐������Ƀ`�F�b�N�����B',
			'�_�C�G�b�g�F�u���傤���Ȃ�����Ȃ��A�������d���񂾂���v�ŋ߁A�̂̓������d���悤�ȁc�c���������đ������H�_�C�G�b�g���Ȃ���I�V�[���v���C���[��PC�́A�s�X�^�C���^�w�i11�t�Ŕ���B�B���F�V�[���v���C���[��PC�́A�����́y��_�z��I�ԁB������y�����z�ɂ��邱�Ƃ��ł���B�c�O�F�V�[���v���C���[��PC�́A�y�s���́z��1�_��������B',
			'�ʐM�̔��F�u�󋵂��m�F���܂��傤�v�ʔ̂�(�L�[���[�h)�𒍕���������ǁA�܂��͂��Ȃ��B�����ʒm�͓͂��Ă���񂾂��ǂȂ��c�c�B�V�[���v���C���[��PC�́A��̑I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�ҋ@�^�q�C�V�t�Ŕ���B�B���F�V�[���v���C���[��PC�́A�A�C�e���̒����烉���_���ɂP�I�сA������P�l������B�c�O�F����{�̎��ނ������_���ň��ޑI�сA�A���ꂪ�PD6��������B',
			'�C�ɂȂ鎋���F�u�o�����X����ꂽ�d�����{�f�B�ł���H�v����{�̒j���w���A���Ȃ��̂��Ƃ����炿�猩�Ă���悤�ȋC������B���[��H���̗p���ȁH�@�V�[���v���C���[��PC�́s�������^����11�t�Ŕ���B�B�B���F�V�[���v���C���[��PC�́A�A�C�e���̒����烉���_���ɂP�I�сA������P�l������B�c�O�F���̃Z�b�V�����̊ԁA����{�t�F�C�Y�̃C�x���g�̔���Ƀ}�C�i�X1�̏C�������B',
			'�v�����������g���F�u�₾�A���\��������Ȃ��A������āv�肢�ɂ��ƁA�����̗����^�͍ō����B���b�L�[�A�C�e����(�L�[���[�h)�����āI�@�悵�A���܂����s����I�@�V�[���v���C���[��PC�́A�����ȊO��PC����1�l��I�сA��̑I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�����^�12�t�Ŕ���B�B���F�V�[���v���C���[��PC�́A�I�΂ꂽPC�ɑ΂���y����l�z��2�_�A�I�΂ꂽPC�́A�V�[���v���C���[�ɑ΂���y����l�z��1�_�A���ꂼ��㏸������B�c�O�F�V�[���v���C���[��PC�́y�s���́z���P�c�U��������B�I�΂ꂽPC�́A�V�[���v���C���[��PC�ɑ΂���y����l�z�̐������Ƀ`�F�b�N������A���̑����������_���ɕύX����(�K���}�C�i�X��)',
 
		]
		return get_table_by_2d6(table)
	end
 
	#�q�C�C�x���g�\�@�����m����P135
	def get_koukai_event_table
		table = [
			'�������������F�u�����K�����ɂ�ł���悤�ˁv�P���ȍq�C�Ŋɂ񂾋C�������������ߒ������߁A(�L�[���[�h)��p�����P�����s���B�V�[���v���C���[��PC�́A��̑I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�K���^�q�C5�t�Ŕ���B�B���F���̃Z�b�V�����̊ԁA�C�x���g����ɐ�������PC�́A��p�A�r���e�B�̔�����s���Ƃ��Ƀv���X1�̏C�������B�c�O�FPC�S���́A�y�s���́z���P�c�U�_��������B',
			'���q�ҁF�u�����͂ɂȂ��Ă����v�U���ɕ���ėc�����q�҂𔭌��B���т��Ă��邯��ǁA���Ăǂ��������̂��B�V�[���v���C���[��PC�́A�s�Ί�^���͂V�t�Ŕ���B�B���F���q�҂�NPC�̐ݒ�����߂�B����NPC�́A�C�x���g����ɐ�������PC�ɑ΂���y����l�z��2�_�㏸����B�c�O�F����{�̔R�����P�c�U��������B',
			'�s�R�̖ځF�u���́c������ɂȂ�܂��v���m��ʈٍ��̍`�Ɋ�`����B�Z���͂�������x�����Ă���悤���B���Ƃ����ǂ��Ȃ�Ȃ����ȁH',
			'�댯�C��F�u�������A�ǂ�ȍєz���Ă�̂�I�v��ʂ�󐣂̑����C����˔j���Ȃ���΂Ȃ�Ȃ��B�}���ł���Ƃ͂����A�댯�ȍq�H���B�V�[���v���C���[��PC�́s�C�}�^�q�C�X�t�Ŕ���B�B�����̃T�C�N���I�����ɂ��̃C�x���g����ɐ�������PC�͖��s���ɂȂ�A�����̃v���C���[���V�[���v���C���[�Ƃ��Ăق̂ڂ̃V�[�����s�����Ƃ��o����B�c�O�FPC�S���͑������P�󂯂�B',
			'�g�Ԃ̉e�F�u�āA�G�͂𔭌������Ⴂ�܂����c�c�v�����̔g�Ԃɉe���������B����͊�ʁH�@�~�H�@����Ƃ��A�G�H�@�V�[���v���C���[��PC�́s�C���^�퓬�V�t�Ŕ���B�B���F��ʕ\��1��g�p���A���̌��ʂ�K�p����B�i�G�͑��̐��́A�V�[���v���C���[PC�̃��x���Ɠ������j�B�c�O�F����{�̒e��[���̃C�x���g������s����PC�̐��~1]D6��������B',
			'�z�[���V�b�N�F�u���c�������Ȃ��Ă邩����H�v�m��⋋�ƈꏏ�ɁA���n����̎莆���󂯎��B��������Ă����i�L�[���[�h�j�Ɏv�킸�ړ����M���Ȃ�B�V�[���v���C���[��PC�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�x���^�퓬�X�t�Ŕ���B�B���FPC�S���́y�s���́z��2�_�񕜂���B�V�[���v���C���[��PC�́A�A�C�e���̒����烉���_����1�I�сA�����1�l������B�c�O�F�V�[���v���C���[��PC�́A�\��������s���B',
			'�ǐՎҁF�u�₾�A�����́H�v��̔g�Ԃɉ������������B����͐����́H�@�V�[���v���C���[��PC�́s�ΐ��퓬�^�퓬�P�P�t�Ŕ���B�B���F��ʕ\��1��g�p���A���̌��ʂ�K�p����B�c�O�F������s����PC�́A������1�󂯂�B',
			'�嗒�F�u�݂�Ȃǂ��������́H�@�ӂ����`�v�������ɑ����B����ȂƂ������A�͂����킹�ď��z���Ȃ���΁I�@�V�[���v���C���[��PC�́s�@���^�q�C�W�t�Ŕ���B�B���F���̃C�x���g����ɐ�������PC�́A�D���ȃL�����N�^�[�ɑ΂���y����l�z��2�_�㏸���邱�Ƃ��ł���B�c�O�F������s����PC�́A���̃V�[���͓o��ł��Ȃ�(���̃V�[�����͑���̏ꍇ�A�����́y�s���́z�������ɂȂ��ēo�ꂷ��)�B',
			'�����̂Ă�ꂽ��n�F�u���肪�����g�킹�Ē����܂��ˁv�ߋ��̍��w�ߏ�����A����(�L�[���[�h)���̍ۂɕ������ꂽ��n��������B�g������̂��c���Ă��邩���H�V�[���v���C���[��PC�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�Ǐ��^��T�t�Ŕ���B�B���F����{�̍D���Ȏ��ޓ��ނ��P�c�U��������B�܂��A���̃V�[���𕽏�V�[���Ƃ��Ĉ����B�c�O�F���̃C�x���g�̔�����s����PC�́y�s���́z���PD6��������B',
			'�l�Y�~�㗤�F�u�ӂ���A�������A��������������[�v�͓��Ƀl�Y�~���唭���B�߂܂���΁A�ԋ{�̂����������炦�邼�B�V�[���v���C���[��PC�́s�q���^�q�C�P�P�t�Ŕ���BPC�̒N�����A�N�V�f���g�\4�Ԃ̌��ʂ��K������Ă���҂�����΁A�B���l�Ƀv���X2�̏C�����t���B�B���F���̃C�x���g����ɐ�������PC�́A�u�A�C�X�v���u�r㻁v���P�l������BPC�̒��ɃA�N�V�f���g�\4�Ԃ̌��ʂ��K������Ă���҂�����΁A���̌��ʂ��������Ƃ��ł���B�c�O�F���̃C�x���g������s����PC�́y�s���́z���PD6��������B����{�̔R�����P�c�U��������B',
			'���̒T���F�u�c�c�܂��܂������v���ȂтĂ��яL���H�ނ͂������񂴂�I�@�����ςł��A���n�Ŏd���ꂽ(�L�[���[�h)�ŐV�N�ȗ������H�ׂ����I�@�V�[���v���C���[��PC�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�H�ו��^��U�t�Ŕ���B�B���FPC�S���́y�s���́z���PD6�_�񕜂���BPC�̒��ɖ\�����Ă���L�����N�^�[������΁A�\����Ԃ��P�񕜂���B�c�O�FPC�S���́A�����_���Ŏ��ނ��P��I�ԁB���̃Z�b�V�����̊ԁA�I�񂾎��ނɑ΂��鎩���̎��ޑ������~�ɂȂ�B',
 
		]
		return get_table_by_2d6(table)
	end
 
	#�O�o�C�x���g�\�@�����m����P136
	def get_gaisyutu_event_table
		table = [
			'�m�u���X�E�I�u���[�W���F�u�{���͂��������悭�A�Ȃ̂ł��B�v(�L�[���[�h)�̊G����Â���B�[�C���͔�Q�ҋ~�ς̂��߃`�����e�B�C�x���g�ɎQ������B�ӂ��킵���h���X�A�b�v���K�v���B�V�[���v���C���[��PC�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s����l�^�w�i�P�O�t�Ŕ���B�B���F�͖��ɓ���Ă���NPC�̐ݒ�����߂�B����NPC�́A���̃C�x���g������s����PC�S���ɑ΂���y����l�z���P�_���㏸����B�c�O�F����{�̎��ނ�1�_����������B',
			'�T�C����F�u������ԁH�@������ˁH�@�����đ�������I�v�͖��t�@�������T�C����ɏo�ȁB���Ĉ�Ԑl�C�͒N�H�@�V�[���v���C���[��PC�́s�����^�w�i�R�t�Ŕ���B�B���F���̃C�x���g����ɐ�������PC�ȊO��PC�S���́A���̃C�x���g����ɐ�������PC�ɑ΂���y����l�z���P�_�㏸����B�c�O�F���̃C�x���g������s����PC�́A�y�s���́z���Q�_��������B',
			'�a�̎s�F�u�ق��A����͂Ȃ��Ȃ��̂��̂���ȁv����������a�̎s�ɏo������B���A�����(�L�[���[�h)�B�@��o��������Ȃ��H�@����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�Õ��^�w�i�T�t�Ŕ���B�B���F�Ƌ�R�C����1�l������B�c�O�F����{�̎��������ׂĂP�c�U����������B',
			'�ǂ������F�u�R�A�C�Â��ꂽ!?�v�X�֏o�������Ƃ���A�͖��̃t�@�������Ɉ͂܂�Ă��܂����B�ϑ����Č떂�����Ȃ��Ɓc�c�B�V�[���v���C���[��PC�́s�ދp�^�퓬�W�t�Ŕ���B�B���F���̃T�C�N���I�����ɁA���̃C�x���g����𐬌�����PC�͖��s���ɂȂ�A�����̃v���C���[���V�[���v���C���[�Ƃ��ėV�уV�[�����s�����Ƃ��o����B�c�O�F���̃C�x���g������s����PC�́A�y�s���́z��[�����̃��x��+1]�_��������B',
			'���荞�݁F�u�͍ڋ@�݂̂Ȃ���A�p�ӂ͂����H�v�͖��͑̂����{�B�g���[�j���O�ő̗͂��Ȃ��ƁB�͍ڋ@�ƈꏏ�ɒ���{�̎��ӂ������j���O���B�V�[���v���C���[��PC�́s�q���^�퓬�S�t�Ŕ���B�B���F���̃C�x���g����ɐ�������PC�́A���̃Z�b�V�����̊ԁA�y�s���́z�̍ő�l���PD6�㏸����B�c�O�F����{�̔R���ƃ{�[�L�T�C�g���P�c�U��������B',
			'�O�H�F�u�����I�@�����ǂ�����H�v����{�̎��ӂɂ�����H�X�ɗ������B������(�L�[���[�h)�ȃ��j���[��H�ׂ����C���I�@�������X�Ȃ����ȁH�@�V�[���v���C���[��PC�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s���G�^�q�C�S�t�Ŕ���B�B���FPC�S���́y�s���́z���Q�c�U�_�񕜂���B�c�O�F���̃C�x���g������s����PC�́A�y�s���́z�����݂̔���(�[���؂�グ)�ɂȂ�',
			'���q�F�u���炢���I�v���q�ɂȂ�A�����Ă���q���ɑ����B�e��T���Ă����Ȃ��Ɓc�c�B�V�[���v���C���[��PC�́s�ʓ|���^���i�S�t�Ŕ���B�B���F���q�ɂȂ��Ă���q����NPC�ݒ�����߂�B����NPC�́A���̃C�x���g����ɐ�������PC�ɑ΂���y����l�z��2�_�㏸����B�c�O�F���̃C�x���g������s����PC�́A�y�s���́z��2�_��������B',
			'�X�����f���F�u�������ɂ���́c�c�p���������ȁv�����ł��o�����B���̓r���A�t�@�b�V�����G���̃J�����}���Ɂu�ʐ^�B�点�Ă������[���v�ƁA������������B�V�[���v���C���[��PC�́s�������^��P�O�t�Ŕ���B�B���F���̃C�x���g����ɐ�������PC�́A�D���ȃA�C�e���P�l������B�c�O�F���̃C�x���g������s����PC�́A����Ɏg�p�������̑������y��_�z�ɂȂ�B',
			'�\�ꁛ�����I�F�u�����A�������Ă�����Ⴂ�I�v�X��(�L�[���[�h)���\��Ă���I����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�������^��S�t�Ŕ���B�B���F���̃C�x���g����ɐ�������PC�́A���̃Z�b�V�����̊ԁA�����́y�Ήz���y���b�́z��1�_�㏸���邱�Ƃ��ł���(���̌��ʂ͗ݐς��Ȃ�)�B�c�O�F���̃C�x���g������s����PC�́A������1�󂯂�B',
			'�Վ��u�t�F�u�݂Ȃ���A���ꏏ�ɂ���΂�܂��傤�v���̒���{�ɏo�����A�V�Ċ͖���������ɍu�t���s�����ƂɂȂ����B����b�����c�c�B�V�[���v���C���[��PC�́s������ׂ�^���i�P�O�t�Ŕ���B�B���F�V�Ċ͖���NPC�̐ݒ�����߂�B����NPC�́A���̃C�x���g�̔���ɐ�������PC�ɑ΂���y����l�z��2�_�㏸����B�c�O�F���̃C�x���g������s����PC�́A�\��������s���B',
			'�f��B�e�F�u�X�^���o�C�I�[�P�[��I�v�͑��̉f����B�邱�ƂɂȂ�A���P�ɏo������B�薼�́u�C���\�v(���C�m��p212)�{(�L�[���[�h)�B�i�D�ǂ��B���Ă����Ȃ��ẮI�@�V�[���v���C���[��PC�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�|�\�^��X�t�Ŕ���B�B���F���̃C�x���g����ɐ�������PC�́A�y�s���́z���P�c�U�_�񕜂���B����{�̍D���Ȏ��ނ�3������B�c�O�F���̃C�x���g������s����PC�́A�D���Ȍ��P�𖢏C���̏�Ԃɂ��A����Ɂs�����^�w�i�R�t���y��_�z�Ƃ��ďC������B',
 
		]
		return get_table_by_2d6(table)
	end
 
	#����C�x���g�\�@�����m����P137
	def get_gekisen_event_table
		table = [
			'����̊�@�F�u���[�����A�n���΂�����I�v(�L�[���[�h)�����������ɁA�͑��̈ӌ����^����ɂȂ�B�V�[���v���C���[��PC�͒���I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�w���^�q�C�P�O�t�Ŕ���B�B���FPC�S���͎����ȊO��PC�̒�����1�l�I�сA����PC�ɑ΂���y����l�z��1�_�㏸����B�c�O�FPC�S���́A�����_���Ɏ����ȊO��PC�̒�����1�l��I�ԁBPC�S���́A�I��PC�ȊO��PC�ɑ΂���y����l�z�̐������Ƀ`�F�b�N������B',
			'�E���F�u�����₾�A�A�肽���c�c�v�킢�̓��X�ɔ��A��������͑��𔲂��o���B���̂܂܏����Ă��܂��̂����������B����ȂƂ��A���Ԃ���̒ʐM���c�c�B�V�[���v���C���[��PC�́s�ʐM�^�q�C�R�t�Ŕ���B�B���F�V�[���v���C���[��PC�́A���̃Z�b�V�����̊ԁA�����́y�s���́z���O�ɂȂ����Ƃ��A��x�����A�����́y�s���́z���P�c�U�_�񕜂��邱�Ƃ��ł���B�c�O�F�V�[���v���C���[��PC�́A�����̂��ׂẮy����l�z�̐������Ƀ`�F�b�N������B',
			'�E�C�̎����F�u�͂��I�@�Y���͑��v�ł��I�v��]�I�ȏ󋵁A�C�����������ׂ��ꂻ���ɂȂ�̂�K���ɂ��炦�邽�߁A(�L�[���[�h)�Ɋւ�������������x���J��Ԃ��B�V�[���v���C���[��PC�́A����I�񂾁i�L�[���[�h�j�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�������^�w�i6�t�Ŕ���B�B���F�V�[���v���C���[��PC�́A���̃Z�b�V�����̊ԁA�������_���[�W���󂯂��Ƃ��A��x�����D���Ȃ����y�s���́z���������邱�Ƃ��ł���B���������y�s���́z�̒l�����A���̃_���[�W���y�����邱�Ƃ��ł���B�c�O�F�V�[���v���C���[��PC�́A�\��������s���B',
			'�����F�u�����������}���ŁI�v�G�͑��Ɋւ����񂪍������A�����Ɏx����������B�V�[���v���C���[��PC�́s�����^�q�C�P�Q�t�Ŕ���B�B���F�V�[���v���C���[��PC�́A�����̑����A�r���e�B���P�I�ԁB���̃Z�b�V�����̊ԁA���̃A�r���e�B�̖����C�����P�_�㏸����B�c�O�F���̃Z�b�V�����̊ԁA�V�[���v���C���[��PC�́A����������s������A�����̑����A�r���e�B�̑����\�͂��g�����тɁA�����́y�s���́z���P�_�����B',
			'�s�ӂ̑����F�u���������ł��I�v�P�͂ōq�s����G�𔭌��B���Ƃ肩���H�@�������A������͂Ȃ��I�@�V�[���v���C���[��PC�́s�����^�퓬�P�O�t�Ŕ���B�B���F���̊͑���̊J�n���A�G�͂̒����烉���_���ɂP�l��I�сA���̓G�͂ɑ������P�^����B�c�O�F�V�[���v���C���[��PC�́A�������P�󂯂�B����{�̒e�򂪂P�c�U��������B',
			'�G�̏P���F�u�Ђ�`�I�@�G���񂸂��`�v�G�͑��̏P�����󂯂�B�G��(�L�[���[�h)��_���Ă���悤���B�V�[���v���C���[��PC�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s��_�^���i�P�Q�t�Ŕ���B�B���F��ʕ\���P��g�p���A���̌��ʂ�K�p����(�G�͑��̐��́A�V�[���v���C���[��PC�̃��x���Ɠ�����)�B�c�O�FPC�S���́A�R�c�U�_�̃_���[�W���󂯂�B',
			'�΋�}����F�u����Ȃ��Ƃ��A���A�G�̔�s�@����Ȃ��́H�v�F�R�̒�@�@���G�̐퓬�@�ɒǂ��Ă���I�@�V�[���v���C���[��PC�́s�΋�퓬�^�퓬�T�t�Ŕ���B�B���F�V�[���v���C���[��PC�́A���̃Z�b�V�����̊ԁA�A�u��@�X�v���u���΋�Q�v�̑����\�͂���x�����g�p���邱�Ƃ��ł���B�c�O�F����{�̒e�򂪂P�c�U��������B',
			'�������F�u�Q�����ȁA���_�̕�������v���݂��̑̂ɍ��܂ꂽ�������������B�V�[���v���C���[��PC�́A�����ȊO�̍D����PC�P�l�I�сA�s���C�^���i�V�t�Ŕ���B�B���F�V�[���v���C���[��PC�ƑI�΂ꂽPC�́A�݂��ɑ΂���y����l�z���P�_�㏸���A�������󂯂Ă����ꍇ�͑������P�񕜂���B�c�O�F�V�[���v���C���[��PC�ƑI�΂ꂽPC�́A�\��������s���A�݂��ɑ΂���y����l�z�̑����������_���ɕύX�����(�K���}�C�i�X��)',
			'�|����Ȃ��ŁF�u���v�A���ɔC���āv����Ńi�[�o�X�ɂȂ�������{�̒��Ԃ����ɁA(�L�[���[�h)�̘b�����ė�����������B�V�[���v���C���[��PC�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�D�����^���͂S�t�Ŕ���B�B���F�V�[���v���C���[��PC�́u���}�C���v���v���P�l������B�c�O�F���̃Z�b�V�����̊ԁA����{�t�F�C�Y�̃C�x���g�̔���Ƀ}�C�i�X�P�̏C�������B',
			'�������т�F�u�ӂ�������ȁI�@�݁A���Ă��ȁI�v�[�C���͂̑�͑��Ƒ����B�N�����𓦂������߁A���Ԃ����̏��ɂȂ�B���Ԃ́u�������т�v�Ƃ����Ō�̐����͂��B�V�[���v���C���[��PC�́s�����������^���i�P�O�t�Ŕ���B�B���F���̃Z�b�V�����̊ԁAPC�S���́y�Ήz���P�_�㏸����B(���̌��ʂ͗ݐς��Ȃ�)�B�c�O�FPC�S���͖\��������s���B',
			'�Ɍ��̏W���F�u�������A�͍ڋ@������ēˌ��B���ꂾ�I�v�Ɍ��ْ̋��̒��A(�L�[���[�h)�����������ɁA���_�����܂łɖ����قǌ������܂���Ă����̂�������B�V�[���v���C���[��PC�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�΂��^���͂W�t�Ŕ���B�B���F�V�[���v���C���[��PC�́A���̃Z�b�V�����̊ԁA��j�ɂȂ����Ƃ��A����ւ̃}�C�i�X�Q�̏C�����Ȃ��Ȃ�A�v���X�P�̏C�������B�c�O�F�V�[���v���C���[��PC�́A����Ɏg�p�������̑������y��_�z�ɂ���B',
 
		]
		return get_table_by_2d6(table)
	end
 
	#�C���C�x���g�\�@�����m����P138
	def get_ninmu_event_table
		table = [
			'���@�F�u����I�@����������牺����Ȃ��ẮI�v(�L�[���[�h)�Ɋւ���g�D�̂��̂����񂪁A����{�̎��@�ɖK���B���̐l�A���܂ł���C���낤�H�@�V�[���v���C���[��PC�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�ʓ|���^���i�S�t�Ŕ���B�B���F����{�̍D���Ȏ��ނ�4������B�c�O�FPC�S���́y�s���́z��2�_��������B',
			'��ۍՂ�F�u���肪���������܂��v�ۊǊ������؂ꂻ���Ȏ��ނ���R����B�ǂ����̂Ă��Ȃ�H�ׂĂ�������ˁH�V�[���v���C���[��PC�́s�⋋�^�q�C�U�t�Ŕ���B�B���FPC�S���́y�s���́z���P�c�U�_�񕜂���B�c�O�F����{�̔R���ƒe�򂪂Q�c�U��������B',
			'�A�C�h�����j�b�g�����F�u�߉ς����A����͂���܁[���I�v����̗v���ŁA���O��(�L�[���[�h)���܂ރA�C�h�����j�b�g��g�ނ��ƂɂȂ����B�V�[���v���C���[��PC�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�A�C�h���^�w�i�W�t�Ŕ���B�B���F�V�[���v���C���[�́APC���D���Ȃ����I�сA����PC�ɑ΂���y����l�z�̐������̃`�F�b�N�����ׂď����B����{�̍D���Ȏ��ނ��P�c�U������B�c�O�F�V�[���v���C���[��PC�́y�s���́z���P�c�U�_�������A�D���ȁy�����z���P���C���̏�Ԃɂ��ās�A�C�h���^�w�i�W�t���y��_�z�ŏC������B',
			'�����C�������F�u�����C��D���`�v���X�̌��C�͂����C����I�@���K�Ȃ����C���C�t��ڎw���ē����ݔ�����������B�V�[���v���C���[��PC�́s�����^��P�P�t�Ŕ���B�B���F���̃Z�b�V�����̊ԁA��������Ƃ��A�������P�񕜂���̂ɕK�v�ȔR���ƍ|�ނ��A1����������B(1�����ɂ͂Ȃ�Ȃ�)�B�c�O�F���̃Z�b�V�����̊ԁA��������Ƃ��A�������P�񕜂���̂ɕK�v�ȔR���ƍ|�ނ��A1��������B',
			'����̗Z�ʁF�u�����͐��Ȃ͂��炢���˂��v���̕������m�ŕ�����Z�ʂ������B�V�[���v���C���[��PC�́s�l���^�w�i�Q�t�Ŕ���B�B���F�V�[���v���C���[��PC�́A�D���Ȏ���3���A�D���ȃA�C�e���P������邱�ƂŁA�D���ȃA�C�e���P���l�����邱�Ƃ��ł���B�c�O�F����{�̍|�ނ��P�c�U��������B',
			'�ً}��A�F�u�͍ڋ@�݂̂Ȃ���A�p�ӂ͂����H�v���ꂽ�X�܂ŁA(�L�[���[�h)�����}�͂��Ȃ���΂Ȃ�Ȃ��Ȃ����B�V�[���v���C���[��PC�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�q���^�퓬�S�t�Ŕ���B�B���F�V�[���v���C���[��PC�́A�A�C�e���̒����烉���_���ɂP�I�сA�����1�l������B�c�O�F����{�̔R���ƃ{�[�L�T�C�g��2����������B',
			'�����̍ė��p�F�u��Еt�������̂������v�s�v�ȑ�����p�����āA���ނ̃��T�C�N���ɂƂ߂�B�V�[���v���C���[��PC�́A�s�}�W���^���i�T�t�Ŕ���B�B���F�V�[���v���C���[��PC�́A�A�C�e���u�J�����ށv���P�l������B����ɁA�����A�r���e�B���A�C�e���P����A����{�̍D���Ȏ��ނ��P�c�U���₷���Ƃ��ł���B�c�O�F����{�̍|�ނ�5��������B',
			'���~�F�u�܂��ǂ��肢�I�v���̒���{�̘A���ɁA�V�������������������B���ʂʁA�킽�������̑������~�����I�@�V�[���v���C���[��PC�́s�������^��W�t�Ŕ���B�B���F�V�[���v���C���[��PC�́A�A�C�e���u�J�����ށv���P�l������B���́u�J�����ށv���g�p�����Ƃ��̊J���́A����邻�ꂼ��̎��ނ̗ʂ������ɂȂ�B(�[���؂�̂�)�B�c�O�F����{�̎��ނ����ׂ�2����������B',
			'�������F�u���������Ă΁A�����Ȃ肷�����I�v�������Z�p���Z����A����I�ȐV����u(�L�[���[�h)��H�v�̔팱�̂ɂȂ�Ȃ����H�@�ƗU����B�V�[���v���C���[��PC�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�閧����^�w�i�X�t�Ŕ���B�B���F�V�[���v���C���[��PC�͑������P�󂯁A���̃Z�b�V�����̊ԁA�y�Ήz�Ɓy���b�́z��1�_�㏸����(���̌��ʂ͗ݐς��Ȃ�)�B�c�O�F�V�[���v���C���[��PC�́A������1�󂯂�B',
			'�����Ɠ`�������Ă΁I�F�u���ɂ��܂����v�񍐂̍s���Ⴂ������_�ɂȂ�A����̕��͋C�������ɂȂ�B�V�[���v���C���[��PC�͎����ȊO��PC��1�l�I��ŁA�s�N�[���^���͂R�t�Ŕ���B�B���F�V�[���v���C���[��PC�ƑI�΂ꂽPC�́A�݂��ɑ΂���y����l�z��1�_�㏸����BPC�S���́y�s���́z��1�_�񕜂���B�c�O�F�V�[���v���C���[��PC�ƑI�΂ꂽPC�́A�\��������s���B',
			'�X�g���C�L�F�u�݂�ȗD�G�Ȏq�����ł�����v(�L�[���[�h)�Ɋւ��邱�Ƃ����������ŁA�d�����񂪃X�g���C�L���N�����B�Ȃ�Ƃ��Ȃ��߂Ȃ��Ắc�c�B�V�[���v���C���[��PC�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�����炩�^���i�R�t�Ŕ���B�B���F���̃Z�b�V�����̊ԁA����{�t�F�C�Y�̃C�x���g����Ƀv���X1�̏C�������B�c�O�F���̃Z�b�V�����̊ԁA����{�t�F�C�Y�̃C�x���g����Ƀ}�C�i�X1�̏C�������B',
 
		]
		return get_table_by_2d6(table)
	end
 
	#���|�C�x���g�\�@�����m����P139
	def get_kyoufu_event_table
		table = [
			'���m�̉����F�u�����肵�Ă邵�A�ڂ������Ă邵�I�v�ǂ���(�L�[���[�h)�Ɏ����A�Ȃɂ�����ȃ��m���C�����畂���яオ���Ă���B�V�[���v���C���[��PC�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�ˌ��^�퓬�U�t�Ŕ���B�B���FPC�S���̖\����Ԃ����ׂĉ񕜂��邱�Ƃ��ł���B�c�O�FPC�S���͖\��������s���A�V�[���v���C���[��PC�͑����P�󂯂�B',
			'�h�b�y���Q���K�[�F�u���킟�A�т����肵���I�v�����ɂ�������̐l���Ƃ���Ⴄ�B�U������Ɣޏ��͏����Ă����B����͂��������c�c�H�@�V�[���v���C���[��PC�́s�s�v�c�^���i�Q�t�Ŕ���B�B���F���̃T�C�N���I�����ɁA�V�[���v���C���[��PC�͖��s���ɂȂ�A�����̃v���C���[���V�[���v���C���[�Ƃ��čD���ȃV�[�����s�����Ƃ��ł���B�c�O�F�u�\���\�v���g�p���āA���̖\����ԂɂȂ�B',
			'�����F�u��΂��o�A��Ȃ��I�@�c�c���A�����B�v(�L�[���[�h)�Ɋւ��鈫���ɂ��Ȃ����B�V�[���v���C���[��PC�́A�����ȊO�̍D����PC���P�l�I��ŁA����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�Q��^��Q�t�Ŕ���B�B���F�V�[���v���C���[��PC�́A���̃Z�b�V�����̊ԁA�I��PC���t�@���u�������Ƃ��A��x�������̔���̃T�C�R����U�蒼�����邱�Ƃ��ł���B�c�O�F�V�[���v���C���[��PC�͖\��������s���B',
			'�C�}�W�i���[�t�����h�F�u��΂��o�A�����ƌ��Ă��H�v���Ȃ��̑��ɂ��āA�����E�C�������l�B�����Ǒ��̐l�ɂ͌����ĂȂ��炵���B�V�[���v���C���[��PC�́s��z�^��R�t�Ŕ���B�B���F�V�[���v���C���[�́A���̃Z�b�V�����̊ԁA�D���ȃ^�C�~���O�ň�x�����A�D����PC�́y�s���́z���P�c�U�_�񕜂��邱�Ƃ��ł���B�c�O�F�V�[���v���C���[��PC�ɑ΂��āy����l�z���P�_�ȏ�l�����Ă���L�����N�^�[�S���́A���̐������Ƀ`�F�b�N������B',
			'�H��D�F�u���A��������ɉ����c�c���A�������ł��Ȃ��ł��v�ˑR���[�_�[����������B�������΂ɒN��������ƕ\������Ă��邪�A�ڂ̑O�ɂ͒N�����Ȃ��B�V�[���v���C���[��PC�́A�s�d�q��^�퓬�Q�t�Ŕ���B�B���F�V�[���v���C���[��PC�́A�A�C�e���u���}�C���v���v���l������B�c�O�F�ȍ~�̒���{�t�F�C�Y�Ɂu�H��D�v���o�ꂵ�A�y�����́z�Q�œ���W�Q���s���Ă���BPC�͗H��D�ɑ΂��Ēʏ�ʂ茂�ޔ�����s���邪�A����Ɏg�p������́s�s�v�c�^���i�Q�t�ɂȂ�B',
			'��̗\���F�u����ȕ������ˁI�v�˔@���ꂽ�s�C���ȘV�k���A(�L�[���[�h)�Ɋւ���s�g�ȗ\�������B�V�[���v���C���[��PC�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�y�ϓI�^���i�W�t�Ŕ���B�B���F�V�[���v���C���[��PC�́A���̃Z�b�V�����̊ԁA�����ȊO��PC���_���[�W���󂯂��Ƃ��A��x�������̃_���[�W�����Ɏ󂯂邱�Ƃ��ł���B�c�O�F�V�[���v���C���[��PC�́y�s���́z������(�[���؂�グ)�ɂȂ�B',
			'���L�F�u�s�K����c�c�v�������ɂ������L������悤�ȋC�����āA���ȗ\���������Ȃ��B�V�[���v���C���[��PC�́s�K�^�^�w�i�V�t�Ŕ���B�B���F�V�[���v���C���[��PC�́A���̃Z�b�V�����̊ԁA�u�A�N�V�f���g�\�v�S�Ԃ̌��ʂ��󂯂Ȃ��Ȃ�B�c�O�F��́A���̃Z�b�V�����̊ԁA�V�[���v���C���[�̐U�����T�C�R������x�����U�蒼�����邱�Ƃ��ł���B',
			'�T���x�[�W�F�u���̂܂܁A�S�Ă̐킢���I����Ă��܂��΂����̂Ɂv���Ă̐킢�Œ��񂾗F�̑����������グ��B�V�[���v���C���[��PC�́A�s���J�^���i�X�t�Ŕ���B�B���F�u�J���\�v(���C�m��p229)���g���āA�����A�r���e�B���P�l������B���̑����A�r���e�B���K�����Ă���L�����N�^�[�́A������A�C�e���u�v���o�̕i�v�Ƃ��Ă��g�p�ł���B(�g�p����ƁA���̑����A�r���e�B�͂Ȃ��Ȃ�)�B�c�O�FPC�S���́y�s���́z���P�c�U�_��������',
			'�t���b�V���o�b�N�F�u���̒��ɉ������c�c�I�v�ӂ���(�L�[���[�h)�Ɋւ���ߋ��̋L�����]���ɕ����сA���̏�Ńp�j�b�N���N�����B�V�[���v���C���[��PC�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�Â��ߋ��^�w�i�S�t�Ŕ���B�B���F�V�[���v���C���[�́A���̃Z�b�V�����̊ԁA��x�����A�D����PC�P�l�̗^�����_���[�W���P�c�U�_�㏸�����邱�Ƃ��ł���B�c�O�F�V�[���v���C���[��PC�́y�s���́z���P�c�U�_�������A�D���ȁy�����z���P�y��_�z�ɂ���B',
			'�[�C�̌Ăѐ��F�u�Èł́A�|���ł��c�c�v�ǂ����炩���ꂽ�[�C���͂��A�U���悤�ɚ��������Ă���B�V�[���v���C���[��PC�́s�f���^���͂Q�t�Ŕ���B�B���F����t�F�C�Y�̓G�͑��̕Ґ��Ɗ��͂̃f�[�^�����狳���Ă��炦��B�c�O�F�V�[���v���C���[��PC�́A��̑I�񂾐[�C���͂ɑ΂���y����l�z���P�_�㏸������B��́A���́y����l�z�̐������Ƀ`�F�b�N���Ȃ���΁A���̐[�C���͂��N���Ƀ_���[�W��^�����Ƃ��A�������g�킹�A�_���[�W�̏㏸���s�����Ƃ��o����B',
			'���҂̐��F�u���A����ȖڂŌ��Ȃ��ŉ������I�v���񂾂͂��̖����͂����ԔG��Ŗڂ̑O�ɗ����A���ׂ�����(�L�[���[�h)�ɂ��Ě����Ă���B������`�������悤���B�V�[���v���C���[��PC�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s���Ȃ��^���͂U�t�Ŕ���B�B���F���񂾂͂��̖����͂�NPC�̐ݒ�����߂�B����NPC�́A�V�[���v���C���[���I��OC�ɑ΂���y����l�z���Q�_�㏸����B�c�O�FPC�S���́A�\��������s���B',
 
		]
		return get_table_by_2d6(table)
	end
 
	#�T���x�[�W�C�x���g�\�@�o���̏���P178
	def get_salvage_event_table
		table = [
			'�܂ꂽ���F�u�������˂��A�V�R�Ƃ������Ƃ��~������ˁv�C��ɒ��񂾍q��@�𔭌�����B�q��@�̃R�b�N�s�b�g�ɂ�(�L�[���[�h)���B����Ă����B�V�[���v���[���[��PC�́A��̑I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�閧����^�w�i�X�t�Ŕ���B�B���F����{�̃{�[�L�T�C�g��2D6������B�V�[���v���[���[PC�́A�������C�����Ă����1�𖢏K����Ԃɂ��A���̃C�x���g�Ɏg�p���������K�����邱�Ƃ��ł���(�����͖��K���̏�Ԃɂ������Ɠ������̂ɂȂ�)�B�c�O�F�V�[���v���[���[PC�͑�����1�󂯂�B',
			'�s���̖\���F�u��x���サ�Ă���A�̐��𐮂��Ȃ��Ɓv�C��֌������r���Ō������C���ɕ߂܂�B�͂₭�����o���Ȃ��ƁA�ǂ�ǂ񗬂���Ă��܂��I�V�[���v���[���[��PC�́s�ދp�^�퓬�W�t�Ŕ���B�B���F����{�̍D���Ȏ��ނ�1D6������B�c�O�F�V�[���v���[���[PC�́A�y�s���́z��1D6�_��������B',
			'�[�C�̉e�F�u���āc�c�����o�Ă���́H�@�����͂ɂ͋C��t���ĂˁH�v�Â��C���j���ł����(�L�[���[�h)�̂悤�ȉe��������B���������߂Â��΁A���ꂪ�����킩�肻�������c�c�댯�͂Ȃ��̂��낤���H�V�[���v���[���[��PC�́A��̑I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s��_�^���i�P�Q�t�Ŕ���B�B���F����{�̍|�ނ�1D6�����A���ɑ�������G�͑��̕Ґ��Ɗ��͂̃f�[�^�����狳���Ă��炦��B�c�O�F�V�[���v���[���[PC�͂́A������1�󂯁A�\��������s���B',
			'�C��T���F�u�f�[�^���o�b�`���ˁI�v�ߋ��̐퓬�L�^�����ɁA���񂾊͂̈ʒu�𐄒肷��B�V�[���v���[���[��PC�́s�Ǐ��^��T�t�Ŕ���B�B���F����{�̍|�ނ�2D6������B�c�O�F�V�[���v���[���[��PC�́y�s���́z��1D6�_��������B����{�̔R����1D6�_��������B',
			'�ܖ������F�u�������I�ɂ�OK�ł��I�v�D�q�̒��ɁA��ʂ̎��ނƂƂ��ɕۑ��H�𔭌�����B�܂��H�ׂ��邾�낤���c�c�B�V�[���v���[���[��PC�́s�q���^�q�C�P�P�t�Ŕ���B�B���F����{�̔R�����e��1D6������BPC�S���́A�A�C�e���u�r㻁v���P�l������B�c�O�FPC�S���́y�s���́z�����݂̔���(�؂�̂�)�ɂȂ�B',
			'�~�܂������ԁF�u�����́A�Â��ł��ˁc�c�v���v���������̒��ɁA�Z�����Ă��Ȃ�������������B�ߋ����؂���ꂽ�悤�ȋ�Ԃ̒��ɁA(�L�[���[�h)���ۂ�ƒu���Y����Ă���B�V�[���v���[���[��PC�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s�K�^�^�w�i�V�t�Ŕ���B�B���F�V�[���v���[���[��PC�́A�A�C�e���u�v���o�̕i�v���P�l������B����{�̍D���Ȏ��ނ��Q������B�c�O�v�V�[���v���[���[��PC�́y�s���́z��1D6�_��������B',
			'�C�����j�F�u������Ⴂ�܂��I�v�C��̊₪�ז������Ď��ނ������o���Ȃ��B�V�[���ɓo�ꂵ�Ă���PC�́s�N�[���^���i�R�t�Ŕ���B�B���F����{�̍|�ނ�1D6�A�D���Ȏ��ނ�3������B�c�O�F����{�̒e��1D6��������B',
			'Tentacles!�F�u�Ȃ񂩃k���k�����那�I�v�E�ъ�鐔�{�̐G��I����ȓ����ނ��H�@����Ƃ��[�C���͂��H�@�S�t�ɂ܂݂ꂽ�G��ŁA�͖��ɗ��݂��Ă���I�@�V�[���v���[���[�́s�@���^�q�C8�t�Ŕ���B�B���F����{�̔R����2D6������B�c�O�F�V�[���v���[���[��PC�́A�y�s���́z��2�_�������A������1�󂯂�B',
			'�҂������F�u�킟�`�B�|���̂����ς��݁[������������v�C����(�L�[���[�h)��������B�߂Â��Ă݂�ƁA(�L�[���[�h)�̉e�Ő[�C���͂��҂������Ă����B�[�C���͂��P���|�����Ă���I�@�V�[���v���[���[��PC�́A����I��(�L�[���[�h)�ɑΉ��������Ŕ���B�v�����Ȃ��ꍇ�́s�ΐ��퓬�^�퓬�P�P�t�Ŕ���B�B���F����{�̍D���Ȏ��ނ�1D6������B�c�O�F�V�[���v���[���[��PC�͑������P�󂯂�B����{�̒e��1D6��������B',
			'����̚����F�u�R�R�}�f�c�c�N���g���c�l�c�v�@�Â��Â��ȊC�̒����j���ł���ƁA�v�l���������܂���Ă����B����ȂƂ��A���Ȃ��ɚ��������Ă��鐺�������B���̐��́A���Ȃ��ɉ���`�������̂��낤�H�V�[���v���[���[��PC�́s�s�v�c�^���i�Q�t�Ŕ���B�B���F�V�[���v���[���[��PC�́A�u���}�C���v���v���l������B����{�̍D���Ȏ��ނ�2������B�c�O�F�V�[���v���[���[��PC�͑�����1�󂯁A�\��������s���B',
			'�C��̕�W�F�u�N�͉��̂��߂ɂ����ɂ���H�v�C��ɂ悱�����̖͂T��ɁA�����̉Ԃ�(�L�[���[�h)���������Ă���B�N����������K�ꂽ�̂��낤���H���̎��A�w��ɉ��҂��̋C�z���������B�V�[���v���[���[��PC�́A����I��(�L�[���[�h)�ɑΉ������w����Ŕ���B�v�����Ȃ��ꍇ�́s���G�^�q�C4�t�Ŕ���B�B���F�����ɖK�ꂽNPC�̐ݒ�����߂�B����NPC�́A�V�[���v���[���[���I��PC�ɑ΂���y����l�z��2�_�㏸����B�c�O�F�V�[���v���[���[��PC�͑�����1�󂯂�BPC�S���́y�s���́z��1D6�_��������B',
 
		]
		return get_table_by_2d6(table)
	end
 
	#�A�C�h���C�x���g�\
	def get_idol_event_table
		table = [
			'������',
			'������',
			'������',
			'������',
			'������',
			'������',
			'������',
			'������',
			'������',
			'������',
			'������',
		]
		return get_table_by_2d6(table)
	end
 
	#�J���\�@���C�m��P229
	def get_develop_table
		table = [
			'����1��\(WP1T)',
			'����1��\(WP1T)',
			'����2��\(WP2T)',
			'����2��\(WP2T)',
			'����3��\(WP3T)',
			'����4��\(WP4T)',
		]
		return get_table_by_1d6(table)
	end
 
	#�J���\(�܂ƂߐU��)
	def get_develop_matome_table
		output1 = '1'
		output2 = '2'
		total_n1 = ""
		total_n2 = ""
 
		dice, diceText = roll(1, 6)
 
		case dice
		when 1
			output1 = '����1��\'
			output2, total_n2 =  get_weapon1_table
		when 2
			output1 = '����1��\'
			output2, total_n2 =  get_weapon1_table
		when 3
			output1 = '����2��\'
			output2, total_n2 =  get_weapon2_table
		when 4
			output1 = '����2��\'
			output2, total_n2 =  get_weapon2_table
		when 5
			output1 = '����3��\'
			output2, total_n2 =  get_weapon3_table
		when 6
			output1 = '����4��\'
			output2, total_n2 =  get_weapon4_table
		end
		result = "#{output1}�F#{output2}"
		number = "#{dice},#{total_n2}"
		return result, number
	end
 
	#����1��\�@���C�m��P229
	def get_weapon1_table
		table = [
			'�����a��C(���C�m��P249)',
			'10�����A�����p�C(���C�m��P249)',
			'�����a��C(���C�m��P249)',
			'15�D2�����A���C(���C�m��P249)',
			'20�D3�����A���C(���C�m��P249)',
			'����(���C�m��P252)',
		]
		return get_table_by_1d6(table)
	end
 
	#����2��\�@���C�m��P229
	def get_weapon2_table
		table = [
			'���C(���C�m��P250)',
			'8�������p�C(���C�m��P250)',
			'����a��C(���C�m��P249)',
			'41�����A���C(���C�m��P250)',
			'46�����O�A���C(���C�m��P250)',
			'�@�e(���C�m��P252)',
		]
		return get_table_by_1d6(table)
	end
 
	#����3��\�@���C�m��P229
	def get_weapon3_table
		table = [
			'�͏㔚���@(���C�m��P250)',
			'�͏�U���@(���C�m��P251)',
			'�͏�퓬�@(���C�m��P251)',
			'��@�@(���C�m��P251)',
			'�d�T(���C�m��P252)',
			'25mm�A���@�e(���C�m��P252)',
		]
		return get_table_by_1d6(table)
	end
 
	#����4��\�@���C�m��P229
	def get_weapon4_table
		table = [
			'�a��(���C�m��P250)',
			'�V�R(���C�m��P251)',
			'�뎮�͐�52�^(���C�m��P251)',
			'�ʉ_(���C�m��P251)',
			'61�����l�A��(�_�f)����(���C�m��P252)',
			'���ǌ^�͖{���^�[�r��(���C�m��P252)',
		]
		return get_table_by_1d6(table)
	end
 
	#�C�ފJ���\�@�����m����P165
	def get_Cannon_table
		table = [
			'�J�����s!�@�����A�r���e�B�͂ł����A���ނ����������B',
			'�J�����s!�@�����A�r���e�B�͂ł����A���ނ����������B',
			'�O���e(�����m���� P169)',
			'25mm�A���@�e(���C�m��P252)',
			'41cm�A���C(���C�m��P250)',
			'8�p���p�C(���C�m��P250)',
			'15.2cm�A���C(���C�m��P249)',
			'����(���C�m��P252)',
			'�@�e(���C�m��P252)',
			'�����a��C(���C�m��P249)',
			'�����a��C(���C�m��P249)',
			'�����a��C(���C�m��P249)',
			'�����a��C(���C�m��P249)',
			'10cm�A�����p�C(���C�m��P249)',
			'20.3cm�A���C(���C�m��P249)',
			'61cm�l�A��(�_�f)����(���C�m��P252)',
			'46cm�O�A���C(���C�m��P250)',
			'15.5cm�O�A���C(���C)(�����m��P167)',
			'61cm�ܘA��(�_�f)����(�����m��P168)',
			'53cm�͎�(�_�f)����(�����m��P168)',
			'��ꎮ�O�b�e(�����m��P169)',
		]
		return get_table_by_nD6(table, 4)
	end
 
	#�͍ڋ@�J���\�@�����m����P165
	def get_plane_table
		table = [
			'�J�����s�I�@�����A�r���e�B�͂ł����A���ނ����������B',
			'�J�����s�I�@�����A�r���e�B�͂ł����A���ނ����������B',
			'�J�����s�I�@�����A�r���e�B�͂ł����A���ނ����������B',
			'�J�����s�I�@�����A�r���e�B�͂ł����A���ނ����������B',
			'�J�����s�I�@�����A�r���e�B�͂ł����A���ނ����������B',
			'�i��87�b�@(�����m����P167)',
			'�����@(�����m����P167)',
			'���d���j�@(�����m����P167)',
			'�뎮�͐�T�Q�^�@(���C�m��P251)',
			'�͏�퓬�@�@(���C�m��P251)',
			'��@�@�@(���C�m��P251)',
			'�͏㔚���@�@(���C�m��P250)',
			'�͏�U���@�@(���C�m��P251)',
			'�ʉ_�@(���C�m��P251)',
			'�a���@(���C�m��P250)',
			'�V�R�@(���C�m��P251)',
			'���_�@(�����m����P168)',
			'�a����j�^�b�@(�����m����P167)',
			'�������@(�����m����P167)',
			'�󕗁@(�����m����P168)',
			'�뎮����ϑ��@�@(�����m����P168)',
		]
		return get_table_by_nD6(table, 4)
	end
 
	#����J���\�@�����m����P165
	def get_special_table
		table = [
			'�J�����s�I�@�����A�r���e�B�͂ł����A���ނ����������B',
			'�J�����s�I�@�����A�r���e�B�͂ł����A���ނ����������B',
			'�J�����s�I�@�����A�r���e�B�͂ł����A���ނ����������B',
			'�J�����s�I�@�����A�r���e�B�͂ł����A���ނ����������B',
			'�T�Ɠ��@(�����m����P169)',
			'�d�T�@(���C�m��P252)',
			'���ǌ^�͖{���^�[�r���@(���C�m��P252)',
			'��l���������ˋ@�@(�����m����P169)',
			'�b�W�I�@�b�@(�����m����P168)',
			'33���ΐ���d�T�@(�����m����P169)',
			'���݃o���W(���^��)�@(�����m����P169)',
		]
		return get_table_by_2d6(table)
	end
 
	#�V�E����J���\�@�����m����P165
	def get_new_special_table
		table = [
			'�J�����s�I�@�����A�r���e�B�͂ł����A���ނ����������B',
			'�J���ϑ��@�@(�����m����P171)',
			'��O�����������@�@(�����m����P171)',
			'�h�����ʁy�A���p�z(�����m����P171)',
			'�T�Ɠ��@(�����m�̏�P169)',
			'�d�T�@(���C�m��P252)',
			'���ǌ^�͖{���^�[�r���@(���C�m��P252)',
			'��l���������ˋ@�@(�����m����P169)',
			'�b�W�I�@�b�@(�����m����P168)',
			'33���ΐ���d�T�@(�����m����P169)',
			'���݃o���W(���^��)�@(�����m����P169)',
		]
		return get_table_by_2d6(table)
	end
 
	#�A�C�e���\�@���C�m��P241
	def get_item_table
		table = [
			'�A�C�X�F���ł��⏕����Ƃ��Ďg�p�ł��܂��B�����́y�s���́z1�c6�_�񕜂��邱�Ƃ��ł��܂��B���Ɗ́u�ԋ{�v�����̃A�C�X�N���[���ł��B',
			'�r㻁F����{�t�F�C�Y�Ȃ�⏕�s���Ƃ��Ďg�p�ł��܂��B�͑��풆�͍U���̑���Ɏg�p�ł��܂��B�D���ȃL�����N�^�[1�l��ڕW�ɑI�сA�ڕW�́y�s���́z��1�c6�_�񕜂��邱�Ƃ��ł��܂��B�͑��풆�̏ꍇ�A�����q�s����̃L�����N�^�[�����ڕW�ɑI�Ԃ��Ƃ͂ł��܂���B���Ɗ́u�ԋ{�v�����̗r㻂ł��B',
			'�J�����ށF����{�t�F�C�Y�ŕ⏕�s���Ƃ��Ďg�p�ł��܂��B�J������x�s�����Ƃ��ł��܂��B���̌��ʂɂ���čs�����J�����C�ɓ���Ȃ������ꍇ�A������x�u�J���\�v�̃T�C�R����U��Ȃ������Ƃ��ł��܂��B�J�����s�����߂ɕK�v�ȓ���Ȏ��ނł��B',
			'�����C���܁F��������Ƃ��ɕ⏕�s���Ƃ��Ďg�p�ł��܂��B�V�[���̏I�����ł͂Ȃ��A���̃A�C�e���g�p���ɁA�����ɂ�鑹���̉񕜂��s�����Ƃ��ł��܂��B�܂��A���̃A�C�e�����g�p�����V�[���̈��x�݂�����������܂��B�͖��̑������u���ɉ񕜂ł������Ȗ�i�ł��B�����Ă���e��̌`����A�ʏ́u�o�P�c�v�Ƃ��Ă΂�Ă��܂��B',
			'���}�C���v���F���������������Ƃ��ɕ⏕�s���Ƃ��Ďg�p�ł��܂��B�������󂯂Ă��鑹����3�ɂȂ�܂ŉ񕜂��܂��B�g�p����Ƃ��̃A�C�e���͂Ȃ��Ȃ�܂��B�v���̃_���R��(�_���[�W�R���g���[��)�W�c�B�d�����񂽂����A�͖��������������Ă���܂��B',
			'�v���o�̕i�F�D���ȂƂ��ɕ⏕�s���Ƃ��Ďg�p�ł��܂��B�D���ȃL�����N�^�[��ڕW�ɑI�т܂��B�v���C���[�����̃A�C�e���ɂ܂��ڕW�Ƃ̎v���o�b�����邱�Ƃ��ł�����A�ڕW���玩���̂o�b�ɑ΂���y����l�z��1�_�㏸�����邱�Ƃ��ł��܂��B���͖̊��ɂƂ��đ厖�Ȏv���o�̈�i�ł��B�A�C�e���̌`��͊l�����Ɍ��肵�܂��B',
		]
		return get_table_by_1d6(table)
	end
 
	#�ڕW�\�@���C�m��P261
	def get_mokuhyou_table
		table = [
			'�G�͂̒��ŁA�����Ƃ��q�s����̍����o�b',
			'�G�͂̒��ŁA�����Ƃ������̑����o�b',
			'�G�͂̒��ŁA�����Ƃ��y���b�́z�̒Ⴂ�o�b',
			'�G�͂̒��ŁA�����Ƃ��y���́z�̒Ⴂ�o�b',
			'�G�͂̒��ŁA�����Ƃ��y�Ήz�̍����o�b',
			'�G�͂̒����犮�S�Ƀ����_���Ɍ���',
		]
		return get_table_by_1d6(table)
	end
 
	#�����\�@���C�m��P263
	def get_dounyuu_table
		table = [
			'�ߊC�x�����^����{����o�����A�ߊC�̓G�����𔭌��A��������r������I�@�y�C���F����t�F�C�Y�Ŋ͑���ɏ�������I�z',
			'�쐼�������x���C���^����{�C��ɒ�@������h�����Ă����G�����𔭌��B����{�ɑ΂��鋺�Ђ����ނ���I�@�y�C���F����t�F�C�Y�œG���͂�����������I�z',
			'�C���q���^���R�����L���鐻�����n�тɏo�����A�R���A�����ז�����G���͂���������I�@�y�C���F����t�F�C�Y�œG�͑��̔����ȏ������������I�z�@�y��V�F�R��2�c6�z',
			'��ꍆ���^�����̌@�n�_���x�����A�o�������G��͊͑����}������I�@�y�C���F����t�F�C�Y�œG�͑��̔����ȏ������������I�z�@�y��V�F�|��2�c6�z',
			'�J���}����^��q��ꕔ���𔺂����G��͊͑����N�U���B���̓������~�߂邽�߁A�o������I�@�y�C���F����t�F�C�Y�Ŋ͑���ɏ�������I�z�@�y��V�F�e��2�c6�z�@�y���l�F�����s�z',
			'���A�����^�R���K���i�̗A���D�c����q���A�G�ʏ��j��͑����}������I�@�y�C���F����t�F�C�Y�Ŋ͑���ɏ�������I�z�@�y��V�F�{�[�L�T�C�g2�c6�z�@�y���l�F�����s�z',
		]
		return get_table_by_1d6(table)
	end
 
	#��ʕ\�@���C�m��P239
	def get_senka_table
		table = [
			'�R���^1�c6�{[�G�͑��̐l��]��',
			'�e��^1�c6�{[�G�͑��̐l��]��',
			'�|�ށ^1�c6�{[�G�͑��̐l��]��',
			'�{�[�L�T�C�g�^1�c6�{[�G�͑��̐l��]��',
			'�C�ӂ̎��ށ^1�c6�{[�G�͑��̐l��]��',
			'����l�^�e���D���ȃL�����N�^�[�ւ́y����l�z�{1',
		]
		return get_table_by_1d6(table)
	end
 
	#�����ʕ\�@�����m����P166
	def get_special_senka_table
		table = [
			'�S�Ă̎��ނ�3���l������',
			'�A�C�e���\(���C�̏�P241)�̒�����D���ȃA�C�e������l������',
			'�Ƌ�R�C����1���l������',
			'�C�ފJ���\(�����̏�P165)����x�g�p���A���̌��ʂɏ]���B(���ނ������K�v�͖���)',
			'�͍ڋ@�J���\(�����̏�P165)����x�g�p���A���̌��ʂɏ]���B(���ނ������K�v�͖���)',
			'�V�E����J���\(�����̏���P168)����x�g�p���A���̌��ʂɏ]���B(���ނ������K�v�͖���)',
		]
		return get_table_by_1d6(table)
	end
 
	#���I��
	def get_kosei_table
		output1 = '1'
		output2 = '2'
		total_n1 = ""
		total_n2 = ""
 
		output1, total_n1 = get_bunya_table
 
		case total_n1
		when 1
			output2, total_n2 =  get_kosei_haikei_table
		when 2
			output2, total_n2 =  get_kosei_miryoku_table
		when 3
			output2, total_n2 =  get_kosei_seikaku_table
		when 4
			output2, total_n2 =  get_kosei_syumi_table
		when 5
			output2, total_n2 =  get_kosei_koukai_table
		when 6
			output2, total_n2 =  get_kosei_sentou_table
		end
		result = "�s#{output2}�^#{output1}#{total_n2}�t"
		number = "#{total_n1},#{total_n2}"
		return result, number
	end
 
	def get_bunya_table
		table = [
			'�w�i',
			'����',
			'���i',
			'�',
			'�q�C',
			'�퓬',
		]
		return get_table_by_1d6(table)
	end
 
	def get_kosei_haikei_table
		table = [
			'�l��',
			'����',
			'�Â��ߋ�',
			'�Õ�',
			'������',
			'�K�^',
			'�A�C�h��',
			'�閧����',
			'����l',
			'�X�^�C��',
			'�O����炵',
		]
		return get_table_by_2d6(table)
	end
 
	def get_kosei_miryoku_table
		table = [
			'�f��',
			'�N�[��',
			'�D����',
			'�����Ƃ₩',
			'���Ȃ�',
			'�Ί�',
			'�΂�',
			'����₩',
			'�ʔ���',
			'������',
			'�h��',
		]
		return get_table_by_2d6(table)
	end
 
	def get_kosei_seikaku_table
		table = [
			'�s�v�c',
			'�����炩',
			'�ʓ|��',
			'�}�W��',
			'����������',
			'���C',
			'�y�ϓI',
			'���J',
			'�������',
			'���R�z��',
			'��_',
		]
		return get_table_by_2d6(table)
	end
 
	def get_kosei_syumi_table
		table = [
			'�Q��',
			'��z',
			'������',
			'�Ǐ�',
			'�H�ו�',
			'������ׂ�',
			'������',
			'�|�\',
			'�������',
			'����',
			'����',
		]
		return get_table_by_2d6(table)
	end
 
	def get_kosei_koukai_table
		table = [
			'�Í�',
			'�ʐM',
			'���G',
			'�K��',
			'�⋋',
			'�ҋ@',
			'�@��',
			'�C�}',
			'�w��',
			'�q��',
			'����',
		]
		return get_table_by_2d6(table)
	end
 
	def get_kosei_sentou_table
		table = [
			'�d�q��',
			'�q��Ō���',
			'�q���',
			'�΋�퓬',
			'�ˌ�',
			'�C��',
			'�ދp',
			'�x��',
			'����',
			'�ΐ��퓬',
			'���',
		]
		return get_table_by_2d6(table)
	end
 
	#���\�@���C�m��P231
	def get_senzyou_table
		table = [
			'���q��F�o�b�͑��Ƃm�o�b�͑��̐j�H�������󋵂ōs���퓬�B����Ȍ��ʂ͔������Ȃ��B',
			'���q��F�o�b�͑��Ƃm�o�b�͑��̐j�H���S���\�x(��������)�Ⴄ��Ԃōs���퓬�B�C���t�F�C�Y��2���E���h�ڂ�1���E���h�ڂƓ����悤�ɏ�������B',
			'�s���L���F�o�b�͑����m�o�b�͑����͂���`�ł̐퓬�B�o�b�͑��S���́y�Ήz��1�_�㏸�������̂Ƃ��Ĉ����B',
			'�s���s���F�o�b�͑����m�o�b�͑��ɕ�͂����`�ł̐퓬�B�q���A�C���A������̂Ƃ��A�����q�s����ɂo�b�Ƃm�o�b�������ꍇ�A�m�o�b�����ɏ�������B',
			'���V��F���╗�J�ȂǂŎ��E���ǍD�łȂ���Ԃł̐퓬�B�݂��͍̊ڋ@�̉Η͏C���Ɓu�q��U���v�̒l��1�_��������B',
			'���C��(�����������傤)�F���g�₤�˂�ȂǊC�̏�Ԃ��ǍD�łȂ���Ԃł̐퓬�B�o�b�͑��̉�𔻒�Ƀ}�C�i�X2�̏C�������B',
		]
		return get_table_by_1d6(table)
	end
 
	#�N�U���ʕ\�@�����m����P181
	def  get_sinkoukouka_table
		table = [
			'���R�F�[�C���͂͏��X�ɗ͂����A��͑��ւƐ���������B����t�F�C�Y�̐[�C���͑��̊͑��ɁA�쒀�n��(�w���C�m���xp258)����l�ǉ������B',
			'�C�托���F����̊C�悪�[�C���͂ɏZ�݂₷�����ɂȂ�B���̃Z�b�V�����̊͑���̊e���E���h�̊J�n���ɁA�[�C���͂̊͑��͒N����l�����y�s���́z���P�c�U�_�����ł���悤�ɂȂ�B�y�s���́z�������ƁA���̐����D���Ȃ��̂ɕύX�ł���B',
			'���D�F�吨�̕�����l�X��D���A�A�ꋎ����B����{�̎��ނ��S�ĂP�c�U������B',
			'�ے��j��F�l�ނ̗��j�I��������M�d�Ȉ�Y�A���E�I�Ȋό��������j�󂳂��BPC�S���́y�s���́z���P�c�U�_��������B',
			'�P���F�[�C���͂̐N�U�ɂ���āA����{�̎��ӂɏZ�ސl�����ɑ傫�Ȕ�Q���o��BPC�S���͖\��������s�����ƁB',
			'�ʏ��j��F�[�C���͂̐N�U�ɂ���āA�ʏ����[�g���j�󂳂��B���̃Z�b�V�����̊ԁA���ނ��l��������ʂ����������Ƃ��A���̎��ނ̐���������������������B',
			'��̖��F��̖����C��𕢂��B���̃Z�b�V�����̊͑��풆�A�[�C���͂̓��E���h�̊J�n���ɁA�y�s���́z���P�c�U�_����ł���悤�ɂȂ�B���̃��E���h�̊ԁA������y�s���́z�̔����̒l(�؂�̂āB�O�`�R�_�̂������ɂȂ�)�����A�[�C���͑S���́A�͑���Ŏ󂯂�_���[�W���y���ł���B���̌��ʂ͗ݐς��邪�A���̌��ʂŌy���ł���_���[�W�̏���͂R�_�ł���B',
			'���n�N�H�F���n��Z�H���A�C�ɕς���B���̎��Ԃɒ���{�ւ̔����܂�B���̃Z�b�V�����̊ԁAPC�S���͂����锻��Ƀ}�C�i�X�P�̏C�������B���̐N�U�ȍ~�A�s�ה�����s��PC�́A���蒼�O�Ɏ����́y�s���́z���P�_����邽�сA�N�U�ɂ��C�������ׂđł��������Ƃ��ł���B',
			'�V�^�����F�[�C���͎͂�����������Ă���悤���B���̃Z�b�V�����̌���t�F�C�Y�ɓo�ꂷ��[�C���͂̒������l��I�ԁB���̐[�C���͂�elite�̃N���X��t������B���̐[�C���͂����ł�elite�Ȃ�flagship�ɁAflagship�Ȃ���ɂ��邱�Ƃ��ł���B',
			'�͖������F�͖����\�߂���A�b�l�����B��̉������ł���̂��E�E�E�E�E�E�B��́A�D����NPC�͖̊�����l�I�ԁB�[�C���͂̈�l�ɁA���͖̊������ŗL�A�r���e�B����K�������邱�Ƃ��o����B',
			'��n���݁F�[�C���͎͂��������̊�n�����������B���̃Z�b�V�����̌���t�F�C�Y�ŁA�[�C���͂̊��͂́A�J�������Ɨ�����Ń_���[�W���󂯂Ȃ��Ȃ�B',
		]
		return get_table_by_1d6(table)
	end
 
	#�\���\�@�����m����P164
	def get_bousou_table
		table = [
			'�ϑz�F�l�X�Ȃ��肦�Ȃ��z�������������߂���B�W���͂𗐂����B�V�[���̏I�����⃉�E���h�̏I�����Ɏ����́y�s���́z���P�_��������B',
			'����m�F�킢�ɂȂ�ƁA�����{�\���ނ��o���ɂȂ�A�����������̂��\��Ȃ��Ȃ�B��������𔻒���s���Ƃ��A�y�s���́z���P�c�U�_����Ȃ��Ɖ�𔻒�ł��Ȃ��Ȃ�B',
			'�����F������ԂɂȂ�A�����邱�Ƃɗ͂����肷���Ă��܂��B�������y�s���́z���������A��������Ƃ��A�]���ɂP�_����Ȃ���΂Ȃ�Ȃ��Ȃ�B',
			'�M���F����l���̂��Ƃ����ڂɓ���Ȃ��Ȃ�A���̐l�ւ̈��ɘf�킳���B���������y����l�z�̒��ŁA�����Ƃ������l�����L�����N�^�[�ɂ����������s�����Ƃ��ł��Ȃ��Ȃ�B(�����Ƃ������l�����l�������ꍇ�A�N�̂��������s���Ȃ��Ȃ�)�B',
			'���S�F�����荂�Ԃ�A�����C�ɂȂ��Ă��܂��B�s��������s�����Ƃ��A�Q�c�U�̏o�ڂ̍��v���S�ȉ����ƃt�@���u���ɂȂ�B',
			'��]�F���������]�������A�l�X�Ȃ��Ƃɏ����₷���Ȃ�B�������_���[�W���󂯂��Ƃ��A���̃_���[�W���P�c�U�_�㏸����B',
		]
		return get_table_by_1d6(table)
	end
 
	#�����\�@���C�m��P273
	def get_yumemi_table
		table = [
			[11, '�����̐��E�F�Í��̐��E�̂Ȃ����A�������ƒ���ł����B�ł̒��ɑ��������Ȍ����A�������P���Ă���B���̌������Ȃ��Ɍ�肩���Ă���B�u���h�����m�J�c�c�A�I�C�E�~�m�E�G�j�c�c�v'],
			[12, '�g������F�N���̎肪�A�D�������Ȃ��̓��𕏂łĂ���B���̎��ʂ��āA�ʂ����肪�`����Ă����B���̗D������͒N�̂��̂������̂��낤�c�c�B'],
			[13, '�j�C�F�������j���C���B�吨�̐l�����Ȃ����]���Ă���B�g�ɗ]�閼�_�ɑ̂������k����B���̒��ŁA���Ȃ��͗L���l�������悤���B�ł��A���ł���ȂɗL���ɂȂ����񂾂낤�H'],
			[14, '�ǓƂȍ��F���Ȃ��͈Â������̒��ł������܂��Ă���B���Ȃ��͂����ƈ�l�ڂ����������B���Ȃ��̎���ɁA���Ȃ��𗝉����Ă����l�͒N�����Ȃ������B'],
			[15, '�Y����Ȃ��Ί�F�N�������Ȃ��̉��Ŕ��΂�ł���B���Ȃ��́A���̏Ί����邽�߂ɐ���Ă����͂��������B�����ꏏ�ɂ������̐l�́A���܂ǂ��ɂ���̂��낤�H'],
			[16, '���F���Ȃ��̋��͊Â����Ȃ��ɂ݂ɐk���Ă����B���̐l�ւ̗��S�ɁA���Ȃ��͂ǂ��Ղ�ƐZ�����Ă����B���̑z���A���̐l�ɓ`�������B�ł��c�c�B'],
			[22, '���_�F���Ȃ��͐����삯�鎀�_�������B���̒��ŁA���Ȃ��͑吨�̖���D���Ă���B�G���A�������c�c�B���Ȃ��̎�͌��h�ꂾ�B���Ȃ��ɂ͉����Ȃ��B�l�E���̋Z�ȊO�́B'],
			[23, '�����F�u���̐킢���I�������c�c�v���������ĒN���̎������A�񑩂������B����͉ʂ����ꂽ�̂��낤���H�񑩂̓��e�ƂƂ��ɁA����͂��Ȃ��̎肩�炱�ڂꗎ���Ă��܂����B'],
			[24, '���؂�F�M���ł��钇�Ԃ��Ǝv���Ă����B��؂ȗF�B���Ǝv���Ă����B�����ǂ����͗��؂����B���Ȃ��𗠐؂�A���Ȃ��̂��Ƃ������čs�����B�����N���M�����Ȃ��c�c�B'],
			[25, '���ی�F�������������j���[�X�B�N���̗��̘b�A�����̖��c�c�[���̋A�蓹�A�݂�ȂƁA����Șb�΂��肵�Ă����B�����̂Ȃ����Ԃ��Ǝv���Ă����B�ł��A����͂��������̂Ȃ����Ԃ������B'],
			[26, '���������F�ƂĂ������������Ȃ����������ڂ̑O�ɂ���B����͐H�ׂĂ��H�ׂĂ��Ȃ��Ȃ�Ȃ��B�ق��؂������������ɂȂ�قǔ��������B�����ƁA�����ƐH�ׂ����Ȃ��B'],
			[33, '�����Ȃ��́F�̂���������B����́A��؂Ȑl����肽���A�Ƃ����́B�K���ȓ��X����肽���A�Ƃ����́B���Ȃ����A���̉̂��������݁A�̐��͏��X�ɑ傫���Ȃ��Ă����B'],
			[34, '���̒��̏����F�R���オ���ꂪ�A�������Ɖ��������Ă����B�������ɂ́A�܂����̖����c�c�B���Ȃ�������Ă��ꂽ���̖��̏Ί炪�Y����Ȃ��B'],
			[35, '�閧�F���̒��ŁA���Ȃ��͎��Ԃ��̂��Ȃ��߂���Ƃ��Ă���B���Ȃ��́A���̍߂�p���A������Ă����B���Ȃ��̍߂͉B�������Ȃ���΂����Ȃ��B'],
			[36, '�S�̂ӂ邳�ƁF�����͖Y����Ȃ��ꏊ�B���Ȃ��ɂƂ��đ�؂ȏꏊ�B�����ł�������΂��āA�������񋃂��āB���̏ꏊ�ɋA�肽���B���͂����Ȃ��A���̏ꏊ�ցc�c�B'],
			[44, '�c�񂾋��F�傫�ȋ��̑O�ɗ����Ă���B���̋��ɉf��p�́A���̂��Ȃ��̎p�Ƃ́A�܂�ňقȂ��Ă���B���̒��̂��Ȃ����A�₢������B�u���O�͉��҂��H�v�ƁB'],
			[45, '�r���F���Ȃ��̎��s���A�����Ăъ񂹂��B�u�c�c�v���Ȃ��̘r�̒��ŁA���̐l���Ŋ��̌��t���₷�B���̌��t���v���o���Ȃ��B���Ȃ��͎��Ȃ������̂��B'],
			[46, '���΁F�ܓV�̋�Ɋ���ȍ����������n��B����́A���҂��̏����̏΂��������B�s�k�̋��J�Ƌ��|�ɁA�̂�������B���̏΂��̎�ɉ�����Ƃ��A�܂��킽���͐킦��̂��낤���H'],
			[55, '�Ƒ��̏ё��F���̒��ŁA���Ȃ��͉Ƒ��ɑ���o����Ă����B�u����΂��Ă��Ȃ����v���������A���Ȃ��͉Ƒ��̌����������B���Ȃ�����ĂĂ��ꂽ��؂ȉƑ��̂��߂ɁB'],
			[56, '���Q�F���Ȃ��͉��҂��ɔs�k�����B�������������́A���Ȃ��ɂƂ��āA�����Ƃ���؂Ȃ��̂�D���Ă������B��΂ɋ����Ȃ��B�����ɕK�����Q���Ȃ���΂����Ȃ��B'],
			[66, '����F���Ȃ��͏����̃h���X��g�ɂ܂Ƃ��A���͂���͏j���̐���������B���Ȃ��ׂ̗ɂ́A�����ƂȂ�ׂ��l�����Ƃꂭ�������ɏ΂��Ă���B���̐l���Ƃ́c�c�H'],
		]
		return get_table_by_d66_swap(table)
	end
 
	#��O���\�@���C�m��P58
	def get_tgaiken_table
		table = [
			[11, '��Ɏ��Ă���l'],
			[12, '�������'],
			[13, '�v���f���[�T�[���'],
			[14, '�V���'],
			[15, '�}�b�`�����'],
			[16, '���N���'],
			[22, '�N���'],
			[23, '�������'],
			[24, '����������'],
			[25, '�C�P�������'],
			[26, '�⍓���'],
			[33, '���L�������'],
			[34, '���t���'],
			[35, '���s�����'],
			[36, '���͖����'],
			[44, '�s�K���'],
			[45, '�ߋ��̈̐l���'],
			[46, '�a�m���'],
			[55, '�������A���t�@�x�b�g���'],
			[56, '���{���'],
			[66, '�d��������'],
		]
		return get_table_by_d66_swap(table)
	end
 
	#�g���\�@�o��P170
	def get_shimei_table
		output1 = '1'
		output2 = '2'
		total_n1 = ""
		total_n2 = ""
 
		dice, diceText = roll(1, 6)
 
		case dice
		when 1
			output1 = '�g���\'
			output2, total_n2 =  get_shimei1_table
		when 2
			output1 = '�g���\'
			output2, total_n2 =  get_shimei2_table
		when 3
			output1 = '�g���\'
			output2, total_n2 =  get_shimei3_table
		when 4
			output1 = '�g���\'
			output2, total_n2 =  get_shimei4_table
		when 5
			output1 = '�g���\'
			output2, total_n2 =  get_shimei5_table
		when 6
			output1 = '�g���\'
			output2, total_n2 =  get_shimei6_table
		end
		result = "#{output1}�F#{output2}"
		number = "#{dice},#{total_n2}"
		return result, number
	end
 
	def get_shimei1_table
		table = [
			'�����́F���Ȃ��͓��ʂȕ����Ő��܂������B�ŐV�̋@�\�𓋍ڂ�������^���B���̂��߁A���̐l�̊�����܂������ł����A�R���v���b�N�X�������Ă���B���Ȃ��́A�R���v���b�N�X���������邽�߁A���̊C��֗����B�g���A�r���e�B�y����^�z�ip172�j���C������B���Ȃ��̎g���́A5�l�ȏ�̃L�����N�^�[�Ƃ��݂��Ɂy����l�z���P�_�ȏ㎝���Ă����ԂɂȂ邱�Ƃł���B',
			'�Ί�̓V�g�F���Ȃ��́A�A�C�h���ɂȂ肽���Ǝv���Ă���B�A�C�h���ɂȂ��āA�l�X�ɏΊ���]��͂������Ǝv���Ă���̂��B���̊C�悪���Ȃ��̐V�����X�e�[�W�I�@�g���A�r���e�B�y�݂�Ȃŉ����I�z�iP172�j���C������B���Ȃ��̎g���́A�Z�b�V�����ɓo�ꂵ���L�����N�^�[�̎����ɑ΂���y����l�z�̍��v���Q�O�_�ȏ�ɂ��邱�Ƃł���B',
			'�L���̘S���F���Ȃ��́u���̐킢�v�̋L���Ɏ����Ă���B����̔@���u���̐푈�v�̈����ɏP���A�s���ȓ��X�𑗂��Ă���B���Ȃ��͋x�ɂ�^�����A���̊C��ւ���Ă����B�g���A�r���e�B�y�Ï��z(P172)���C������B���Ȃ��̎g���́A���������̐��E�ɏ����̎p�Ő��܂�Ă����Ӗ��𔭌����邱�Ƃł���B',
			'�w�G�F���Ȃ��͋w�G�ƌĂԂׂ��[�C���͂�����B�ȑO�̐킢�Ŕs�k���i�������Ȃ��́A���Q�̋@������������Ă����B����ȋw�G���ڌ����ꂽ�Ƃ����b�𕷂��A���̊C��ɂ���ė����B�g���A�r���e�B�y�s�s�̐����z�iP172�j���C������B���Ȃ��̎g���́A�����̋w�G�����������邱�Ƃł���B',
			'��C�̃O�����F���Ȃ��͎��ނɂ͏������邳���B���̊C��ɂ́A�f���炵�����̗ǂ����ނ�����ƕ����Ă���B���Ȃ��́A���̎��ނ����Ј�x������Ă݂����Ǝv���Ă����B�g���A�r���e�B�y��H�́z�iP172�j���C������B���Ȃ��̎g���́A�⋋���s���A�����́y�s���́z��50�_���񕜂��邱�Ƃł���',
			'��ւ̎v���F��ւ̑z���@���Ȃ��́A��ɗ����Ă���B�ǂ��ɂ����Ē�̗͂ɂȂ肽���Ǝv���Ă���B�g���A�r���e�B�y���S�z(P172)���C������B���Ȃ��̎g���́A��ɑ΂��鎩���́y����l�z�ƁA�����ɑ΂����́y����l�z�����݂��ɂT�ɂ��邱�Ƃł���B',
		]
		return get_table_by_1d6(table)
	end
	def get_shimei2_table
		table = [
			'�e���F���Ȃ��͑�D���Ȋ͖�������B���Ȃ��́A���̐l�̍K��������Ă�܂Ȃ��B��؂Ȑl�Ƃ��āA�D����PC��I�Ԃ��ƁB���̐l�����A�Ƃ���C��ō����Ă���Ƃ����\�𕷂������B�����ł��Ȃ��́A��؂Ȑl�������邽�߁A���̊C��ɗ����̂��B�g���A�r���e�B�y�S�z���z(P173)���C������B���Ȃ��̎g���́A��؂Ȑl��PC�Ǝ����̂��݂��ɑ΂���y����l�z���T�ɂ��邱�Ƃł���B',
			'�؁F���Ȃ��́A�����Ƃ��Ĕ��������肽���Ǝv���Ă���B�͖��Ƃ����ǈ�l�̏����B�킢�ɏ������ł͂Ȃ��A�������D��ȑ��݂ł���ׂ����B���Ȃ��͏��𖁂��ׂ��A���̊C��ɂ���Ă����B�g���A�r���e�B�y���z�iP173�j���C������B���Ȃ��̎g���́A�����̌���6�ȏ�ɂ��A���̑�����S�āy�����z�ɂ��邱�Ƃł���',
			'����̋L���F���Ȃ��́A�ߋ��Ɉ�x�����������Ƃ�����B���̂Ƃ��A���҂������Ȃ���������A���̊C��ւƘA��Ă����B�N�����Ȃ����~�����̂��͂���Ȃ����A����Ŋm���ɂ��̐l�̐��𕷂����悤�ȋC������B�g���A�r���e�B�y���_�̒����z(P173)���C������B���Ȃ��̎g���́A����ŕ����������̓��e���v���o�����Ƃł���B',
			'��j�̌����F���Ȃ��́A�ߋ��̊͂Ƃ��Ă̋L�����Ȃ��B���͖̊��������u���̐킢�v�̋L���������Ă���̂ɑ΂��A���Ȃ��ɂ́A���̋L�������Ȃ��B�g���A�r���e�B�y���C�z(P173)���C������B���Ȃ��̎g���́A�u���̐킢�v�ŁA�������ǂ�Ȋ͂������̂���m�邱�Ƃł���B',
			'����ȉ^���F���Ȃ��́A���X�����̐l�Ԃ��B���ʂɕ�炵�Ă������A�Ȃ����ߋ��̊��̋L���Ɨ͂���ɓ���Ă��܂����B�g���A�r���e�B�y�l�̐S�z�iP173)���C������B���Ȃ��̎g���́A�Ȃ��������͖��ɂȂ����̂��A���̘b��˂��~�߂邱�Ƃł���B',
			'�a���ւ̊肢�F���Ȃ��͐[�C���͂Ƃ킩�荇����̂ł͂Ȃ����A�Ǝv���Ă���B�G�Ƃ͂����A�ł���Α���𒾂߂����͂Ȃ��B���݂��ɏ��������ȊO�̕��@�ŁA���̐킢���I��点�铹��T���Ă���B�g���A�r���e�B�y�Θb�z�iP173�j���C������B���Ȃ��̎g���́A�[�C���͂Ƃ��݂��Ɉӎv��a�ʂ����邱�Ƃł���B',
		]
		return get_table_by_1d6(table)
	end
	def get_shimei3_table
		table = [
			'�ڎw���ׂ����F���Ȃ��́A�����͎̊�ɃR���v���b�N�X�������Ă���B�D���Ȋ͎�1�I�ԁB���Ȃ��́A�{���͂��͎̊�ɂȂ肽���Ǝv���Ă���B���̕��@�������Ă��炤���߁A�����̖ڎw���ׂ�����̐l������A���̊C��ւ���Ă����B�g���A�r���e�B�y�Ȃ肫��z�iP174�j���C������B���Ȃ��̎g���́A����̐l�̓����ɏ]���A�����̐i�ނׂ����������ꂤ���Ƃł���B',
			'�E�H�[�����K�[�F���Ȃ��́A�킢�������Ă���B�����͖��̋P���ł���A���������ō��̔����ł���B���ɂ���Ƃ�����ԁA�����̑��݉��l����������B�g���A�r���e�B�y���z(P174)���C������B���Ȃ��̎g���́A�G�͂�20�l�ȏ㍌�������邱�Ƃł���B',
			'��ނ̒B�l�F���Ȃ��́A���̐킢�ɂ��Ēm���Ă��炤���߁A�]�R��L���o�ł��悤�Ǝv���Ă���B�����̐l�ɓǂ�ł��炤���߂ɂ́A���������������g�s�b�N�X���K�v���B�����ŁA���Ȃ��͂��̊C��ɂ���Ă����B�g���A�r���e�B�y�X�N�[�v�I�z(P174)���C������B�Z�b�V�������A(�L�[���[�h)���g�����C�x���g�����������V�[���̉񐔂��������Ă������ƁB���Ȃ��̎g���́A���̉񐔂�20��ȏ�ɂ��邱�Ƃł���B',
			'�ٖM�́F���Ȃ��́A�ʂ̐��E������Ă������݂ł���B���Ȃ��͌��������E�ł͌R�͂Ƃ��Đ���Ă������A���̐��E�ɗ����Ƃ��Ɋ͖��ɂȂ����悤���B���̐��E�ɗ��ď��߂Đ[�C���͂��������Ȃ��́A�͂�݂������Ǝv���̂Ɠ����ɁA���������E�ɖ߂肽�����������B�g���A�r���e�B�y���l�z(P174)���C������B���Ȃ��̎g���́A���Ƃ������E�֋A����@�������邱�Ƃł���B',
			'�����̍߁F���Ȃ��́A�����̍߂𒅂����ߐl������������ꂽ�͖��ł���B���Ȃ��͌쑗�̓r���ɓ����o���A�ǎ��U��؂��āA���̊C��ɂ���Ă����B�g���A�r���e�B�y�������z(P174)���C������B���Ȃ��̎g���́A�����̖����𐰂炷���Ƃł���B',
			'�퓬�@�B�F���Ȃ��́A�퓬�@�B�ł���B����ł���͖��ɏ��炵���₩�킢���͕s�v�ƍl���Ă���A�ł��邾�����l�炵���A����炵���U�镑���Ă���B����Ȃ��Ȃ��̐��i��ς��邽�߁A��͂��̊C��ɂ��Ȃ��𑗂�o�����B�g���A�r���e�B�y�|�̐S�z(P174)���C������B���Ȃ��̎g���́A����Ƃ��Ă̎����Ə����Ƃ��Ă̎����ɐ܂荇����t���邱�Ƃł���B',
		]
		return get_table_by_1d6(table)
	end
	def get_shimei4_table
		table = [
			'���񂾌̋��F���Ȃ��̌̋��͐[�C���͂����W����A���v�����B���Ȃ��́A�̋��̕���������Ă���B���̊C��ɂ���΁A���̕����̎菕�����邱�Ƃ��ł��邩������Ȃ��B�g���A�r���e�B�y�]���z(P175)���C������B���Ȃ��̎g���́A�����̌̋��𕜊���������@�������邱�Ƃł���B',
			'���l�F���Ȃ��ɂ́A���l������B���Ȃ��́A���̐l���ɖ����~��ꂽ�B���l�Ƃ��āA�D����PC��1�l��I�Ԃ��ƁB���̐l�����A���̊C��ł��Ȃ���΂����Ȃ����Ƃ�����ƌ����B�����ŁA���l�������邽�߁A�ꏏ�ɂ��̊C��ɗ����̂��B�g���A�r���e�B�y���`�z(P175)���C������B���Ȃ��̎g���́A����PC�̎g����B�����邱�Ƃł���B',
			'�݌�ҁF���Ȃ��́A���ׂ����̂�����B�������A���̎��ׂ��҂́A���Ȃ��̓]���ɍ��킹�Ĉꏏ�ɂ��̊C��ɂ��Ă��Ă��܂����B��ƈꏏ�Ɂu���ׂ��ҁv�̐ݒ���s�����ƁB����NPC�́A���̐ݒ�ɂ�����炸�A�퓬�\�͂������Ȃ����݂Ƃ��Ĉ������ƁB�g���A�r���e�B�y���_�z(P175)���C������B���Ȃ��̎g���́A���ׂ��҂������Ȃ�悤�����A�Ƃ藧�������邱�Ƃł���B',
			'���Q�S�F���Ȃ��̒���{�́A���؂�҂̑��݂̂����ŉ�ł����B��؂Ȓ�◻�͂����́A���ׂĊC�ɒ���ł������B���؂�҂͎̊��1��ޑI�ԁB���Ȃ��́A���؂�҂�ǂ��Ă��̊C��ɂ���Ă����B�g���A�r���e�B�y���z(P175)���C������B���Ȃ��̎g���́A���؂�҂�߂܂��A���̍߂����킹�邱�Ƃł���B',
			'�ЉЂ̒��S�F���Ȃ��͎��_�Ƃ��ċ����ꂽ���݂��B���Ȃ��ƈꏏ�ɂ���҂͓G���������A�݂Ȏ���ł������B���Ȃ��̌������͑������Ȃ����c���đS�ŁB���ꏊ�̂Ȃ��Ȃ������Ȃ��́A���̊C��ɂ���Ă����B�g���A�r���e�B�y���_�z(P175)���C������B���Ȃ��̎g���́A�����̋��ꏊ�������邱�Ƃł���B',
			'�X�p�C�F���Ȃ��́A��w������̖����󂯐��������X�p���ł���B�����̒���{�����ɂ�镗�I�̗���͂�����Ƃ����������B���̊C��ɂ������{�́A�s���̏؋��𒲍�����悤�������Ă���B�g���A�r���e�B�y�B���s���z(P175)���C������B���Ȃ��̎g���́A���̊C��̒���{�ōs���Ă���s���̏؋��𔭌����邱�Ƃł���B',
		]
		return get_table_by_1d6(table)
	end
	def get_shimei5_table
		table = [
			'�[�C�̌Ăѐ��F���Ȃ��́A���̊C��ɗ��Ă���̂̈ꕔ���ٌ`�����Ă���B�����̎���K���A����p�ȂǁA���ʂ͖̊��ɂ͂Ȃ�����Ȋ튯�����Ă���B���Ȃ��́A���������������ɂȂ��Ă��܂��̂ł͂Ȃ����A�Ƌ����Ă���B�g���A�r���e�B�y�ٌ`�z(P176)���C������B���Ȃ��̎g���́A���Ƃɖ߂���@�������邱�Ƃł���B',
			'�����ꂽ�v���F���Ȃ��́A�ߋ��ɗ��͂������Ă���B�����ԍہA���͂́A���Ȃ��Ɍ`���̕i������A������̋��ɓ͂��ė~�����Ɨ��񂾁B�`���Ƃ��Ď����̏K�����Ă��鑕���A�r���e�B�̒������I�ԁB���Ȃ��́A�`����͂��邽�߁A���͂̌̋�������A���̊C��ɂ���Ă����B�g���A�r���e�B�y�`���z(P176)���C������B���Ȃ��̎g���́A�����ꂽ�`�����̎w�肵���ꏊ(�������͐l���܂�)�͂��邱�Ƃł���B',
			'��@�C���F���Ȃ��͍��������\�͂�L�����͖��ł���B��w���ɂ��ƁA�[�C���͂������ɐV���ȍ������ł���Ƃ̂��Ƃł���B���Ȃ��͂��̎��Ԃ𒲍����邽�߁A�������󂯁A���̊C��ɂ���Ă����B�g���A�r���e�B�y�����́z(P176)���C������B���Ȃ��̎g���́A���̊C��ɂ���[�C�����̊�n��˂��~�߂邱�Ƃł���B',
			'���a�ҁF���Ȃ��́A�ƂĂ����a���B���x����Ă��A���̋��|�ɑł������Ƃ��ł��Ȃ��B�O��̔C���ł������������A���̌�A���̊C��ւ̓]���𖽂���ꂽ�B�g���A�r���e�B�y���|�S�z(P176)���C������B���Ȃ��̎g���́A�����̒��̋��|�ɑł������Ƃł���B',
			'���_�F���Ȃ��ɂ͑�؂Ȓ��Ԃ������B�������A�ޏ��͂���C��ł̐킢�Ɍ������A�A���Ă��Ȃ������B�Ƃ��ɂ��̊C��ւƌ��������ޏ��̗��͂́A�ޏ����܂����̏ꏊ�ɂ���Ƃ����B�g���A�r���e�B�y�r�����z(P176)���C������B���Ȃ��̎g���́A���̊C��ɋ���͂��̒��Ԃ�������邱�Ƃł���B',
			'����Ȃ��S�F���Ȃ��͔��Ă����B�J��Ԃ����킢�B����ł����G�Ɩ����̑D�B����ȓ��X�ɑς����Ȃ��Ȃ�A���Ȃ��͌���������{������A���̊C��ɂ���Ă����B�g���A�r���e�B�y�키�Ӗ��z(P176)���C������B���Ȃ��̎g���́A�킢�̈Ӌ`���Ĕ������邱�Ƃł���B',
		]
		return get_table_by_1d6(table)
	end
	def get_shimei6_table
		table = [
			'�L���r���F���Ȃ��͂Ȃ��������ɂ����B�C���t���ƁA�����C�̏�ɕ�����ł����B�Ƃ���鑾�z�����Ȃ���A���Ȃ��́A���������҂Ȃ̂��v���o�����Ƃ��ł��Ȃ������B�g���A�r���e�B�y�󔒁z�iP177�j���C������B���Ȃ��̎g���́A�����̋L�������߂����Ƃł���B',
			'�y�́F���Ȃ��́A�l�ނ͎��ɒl���Ȃ��Ǝv���Ă���B���̘A���́A��������ŁA���l�̎��΂�����Ă���B����Ȏ҂̂��߂ɖ���q���邱�Ƃɋ^������������Ȃ��́A���̊C��ł����Ԃ��Ă����B�g���A�r���e�B�y�Ǎ��z(P177)���C������B���Ȃ��̎g���́A�������Ăѐ키���R�������邱�Ƃł���B',
			'�^���̏o��F���Ȃ��́A���U�̔�����T���Ă���B�����̒���������Ȃ��ǓƂ���₵�Ă����l�B����Ȑl����T�����߁A���Ȃ��͂��̊C��ɂ���Ă����B�g���A�r���e�B�y�҃A�s�[���z(P177)���C������B���Ȃ��̎g���́A�����̔����ɂӂ��킵���l���ƌ��΂�邱�Ƃł���B',
			'�U���̉p�Y�F���Ȃ��́A�Ƃ���킢�̉p�Y�̋U�����B���Ȃ��͂��̊C��ɂ����ނ��A�p�Y�I�Ȋ���������͖��̖����x�����̂��B�݂�Ȃ́A���Ȃ��͂��͖̊����ƂƐM���Ă��邪�A�o�������ςȂ��ƂɂȂ邾�낤�B���Ȃ��́A�g���A�r���e�B�y�R���v���b�N�X�z(P177)���C������B���Ȃ��̎g���́A���Ȃ�����������A���͖̊��𒴂��邱�Ƃł���B',
			'�b���͖��F���Ȃ��́A�l�X�Ȑ���]�X�Ƃ���b���͖��ł���B�ߋ��ɐF�X�����������ŁA���ɂȂ�Ȃ��킢�͐�������Ȃ����Ƃɂ��Ă���B�傫�Ȑ킢�����肻���ȋC�z�������āA���̊C��ɂ���Ă����B�g���A�r���e�B�y�Ë��ҁz(P177)���C������B���Ȃ��̎g���́A�������厖�Ȃ��̂������邱�Ƃł���B',
			'���C�o���F���Ȃ��͓����͑��̒��ɁA��΂ɕ��������Ȃ��Ǝv���Ă��郉�C�o��������B�D����PC��1�l�I�Ԃ��ƁB�g���A�r���e�B�y�D�G��z(P177)���C������B���Ȃ��̎g���́A5��ȏ�A�o���l�l���̍ۂɃ��C�o����������MVP�Ƃ��Ďw��������邱�Ƃł���',
		]
		return get_table_by_1d6(table)
	end


end