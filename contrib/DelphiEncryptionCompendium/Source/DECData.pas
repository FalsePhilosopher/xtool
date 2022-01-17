{*****************************************************************************
  The DEC team (see file NOTICE.txt) licenses this file
  to you under the Apache License, Version 2.0 (the
  "License"); you may not use this file except in compliance
  with the License. A copy of this licence is found in the root directory
  of this project in the file LICENCE.txt or alternatively at

    http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing,
  software distributed under the License is distributed on an
  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
  KIND, either express or implied.  See the License for the
  specific language governing permissions and limitations
  under the License.
*****************************************************************************}

/// <summary>
///   Data Arrays for the Hash and Cipher functions
/// </summary>
unit DECData;

interface

{$INCLUDE DECOptions.inc}

{$IFOPT Q+}{$DEFINE RESTORE_OVERFLOWCHECKS}{$Q-}{$ENDIF}
{$IFOPT R+}{$DEFINE RESTORE_RANGECHECKS}{$R-}{$ENDIF}

const
  Square_TE: array[0..3, 0..255] of UInt32 = (
   ($26B1B197,$A7CECE69,$B0C3C373,$4A9595DF,$EE5A5AB4,$02ADADAF,$DCE7E73B,$06020204,
    $D74D4D9A,$CC444488,$F8FBFB03,$469191D7,$140C0C18,$7C8787FB,$16A1A1B7,$F05050A0,
    $A8CBCB63,$A96767CE,$FC5454A8,$92DDDD4F,$CA46468C,$648F8FEB,$D6E1E137,$D24E4E9C,
    $E5F0F015,$F2FDFD0F,$F1FCFC0D,$C8EBEB23,$FEF9F907,$B9C4C47D,$2E1A1A34,$B26E6EDC,
    $E25E5EBC,$EAF5F51F,$A1CCCC6D,$628D8DEF,$241C1C38,$FA5656AC,$C5434386,$F7FEFE09,
    $0907070E,$A36161C2,$FDF8F805,$9F7575EA,$EB5959B2,$F4FFFF0B,$05030306,$66222244,
    $6B8A8AE1,$86D1D157,$35131326,$C7EEEE29,$6D8888E5,$00000000,$120E0E1C,$5C343468,
    $3F15152A,$758080F5,$499494DD,$D0E3E333,$C2EDED2F,$2AB5B59F,$F55353A6,$65232346,
    $DD4B4B96,$C947478E,$3917172E,$1CA7A7BB,$459090D5,$5F35356A,$08ABABA3,$9DD8D845,
    $3DB8B885,$94DFDF4B,$D14F4F9E,$F95757AE,$5B9A9AC1,$439292D1,$98DBDB43,$2D1B1B36,
    $443C3C78,$ADC8C865,$5E9999C7,$0C040408,$678E8EE9,$D5E0E035,$8CD7D75B,$877D7DFA,
    $7A8585FF,$38BBBB83,$C0404080,$742C2C58,$4E3A3A74,$CF45458A,$E6F1F117,$C6424284,
    $AF6565CA,$60202040,$C3414182,$28181830,$967272E4,$6F25254A,$409393D3,$907070E0,
    $5A36366C,$0F05050A,$E3F2F211,$1D0B0B16,$10A3A3B3,$8B7979F2,$C1ECEC2D,$18080810,
    $6927274E,$53313162,$56323264,$2FB6B699,$847C7CF8,$25B0B095,$1E0A0A14,$957373E6,
    $ED5B5BB6,$8D7B7BF6,$2CB7B79B,$768181F7,$83D2D251,$170D0D1A,$BE6A6AD4,$6A26264C,
    $579E9EC9,$E85858B0,$519C9CCD,$708383F3,$9C7474E8,$20B3B393,$01ACACAD,$50303060,
    $8E7A7AF4,$BB6969D2,$997777EE,$110F0F1E,$07AEAEA9,$63212142,$97DEDE49,$85D0D055,
    $722E2E5C,$4C9797DB,$30101020,$19A4A4BD,$5D9898C5,$0DA8A8A5,$89D4D45D,$B86868D0,
    $772D2D5A,$A66262C4,$7B292952,$B76D6DDA,$3A16162C,$DB494992,$9A7676EC,$BCC7C77B,
    $CDE8E825,$B6C1C177,$4F9696D9,$5937376E,$DAE5E53F,$ABCACA61,$E9F4F41D,$CEE9E927,
    $A56363C6,$36121224,$B3C2C271,$1FA6A6B9,$3C141428,$31BCBC8D,$80D3D353,$78282850,
    $04AFAFAB,$712F2F5E,$DFE6E639,$6C242448,$F65252A4,$BFC6C679,$15A0A0B5,$1B090912,
    $32BDBD8F,$618C8CED,$A4CFCF6B,$E75D5DBA,$33111122,$E15F5FBE,$03010102,$BAC5C57F,
    $549F9FCB,$473D3D7A,$13A2A2B1,$589B9BC3,$AEC9C967,$4D3B3B76,$37BEBE89,$F35151A2,
    $2B191932,$211F1F3E,$413F3F7E,$E45C5CB8,$23B2B291,$C4EFEF2B,$DE4A4A94,$A2CDCD6F,
    $34BFBF8B,$3BBABA81,$B16F6FDE,$AC6464C8,$9ED9D947,$E0F3F313,$423E3E7C,$29B4B49D,
    $0BAAAAA1,$91DCDC4D,$8AD5D55F,$0A06060C,$B5C0C075,$827E7EFC,$EFF6F619,$AA6666CC,
    $B46C6CD8,$798484FD,$937171E2,$48383870,$3EB9B987,$271D1D3A,$817F7FFE,$529D9DCF,
    $D8484890,$688B8BE3,$7E2A2A54,$9BDADA41,$1AA5A5BF,$55333366,$738282F1,$4B393972,
    $8FD6D659,$887878F0,$7F8686F9,$FBFAFA01,$D9E4E43D,$7D2B2B56,$0EA9A9A7,$221E1E3C,
    $6E8989E7,$A06060C0,$BD6B6BD6,$CBEAEA21,$FF5555AA,$D44C4C98,$ECF7F71B,$D3E2E231),
   ($B1B19726,$CECE69A7,$C3C373B0,$9595DF4A,$5A5AB4EE,$ADADAF02,$E7E73BDC,$02020406,
    $4D4D9AD7,$444488CC,$FBFB03F8,$9191D746,$0C0C1814,$8787FB7C,$A1A1B716,$5050A0F0,
    $CBCB63A8,$6767CEA9,$5454A8FC,$DDDD4F92,$46468CCA,$8F8FEB64,$E1E137D6,$4E4E9CD2,
    $F0F015E5,$FDFD0FF2,$FCFC0DF1,$EBEB23C8,$F9F907FE,$C4C47DB9,$1A1A342E,$6E6EDCB2,
    $5E5EBCE2,$F5F51FEA,$CCCC6DA1,$8D8DEF62,$1C1C3824,$5656ACFA,$434386C5,$FEFE09F7,
    $07070E09,$6161C2A3,$F8F805FD,$7575EA9F,$5959B2EB,$FFFF0BF4,$03030605,$22224466,
    $8A8AE16B,$D1D15786,$13132635,$EEEE29C7,$8888E56D,$00000000,$0E0E1C12,$3434685C,
    $15152A3F,$8080F575,$9494DD49,$E3E333D0,$EDED2FC2,$B5B59F2A,$5353A6F5,$23234665,
    $4B4B96DD,$47478EC9,$17172E39,$A7A7BB1C,$9090D545,$35356A5F,$ABABA308,$D8D8459D,
    $B8B8853D,$DFDF4B94,$4F4F9ED1,$5757AEF9,$9A9AC15B,$9292D143,$DBDB4398,$1B1B362D,
    $3C3C7844,$C8C865AD,$9999C75E,$0404080C,$8E8EE967,$E0E035D5,$D7D75B8C,$7D7DFA87,
    $8585FF7A,$BBBB8338,$404080C0,$2C2C5874,$3A3A744E,$45458ACF,$F1F117E6,$424284C6,
    $6565CAAF,$20204060,$414182C3,$18183028,$7272E496,$25254A6F,$9393D340,$7070E090,
    $36366C5A,$05050A0F,$F2F211E3,$0B0B161D,$A3A3B310,$7979F28B,$ECEC2DC1,$08081018,
    $27274E69,$31316253,$32326456,$B6B6992F,$7C7CF884,$B0B09525,$0A0A141E,$7373E695,
    $5B5BB6ED,$7B7BF68D,$B7B79B2C,$8181F776,$D2D25183,$0D0D1A17,$6A6AD4BE,$26264C6A,
    $9E9EC957,$5858B0E8,$9C9CCD51,$8383F370,$7474E89C,$B3B39320,$ACACAD01,$30306050,
    $7A7AF48E,$6969D2BB,$7777EE99,$0F0F1E11,$AEAEA907,$21214263,$DEDE4997,$D0D05585,
    $2E2E5C72,$9797DB4C,$10102030,$A4A4BD19,$9898C55D,$A8A8A50D,$D4D45D89,$6868D0B8,
    $2D2D5A77,$6262C4A6,$2929527B,$6D6DDAB7,$16162C3A,$494992DB,$7676EC9A,$C7C77BBC,
    $E8E825CD,$C1C177B6,$9696D94F,$37376E59,$E5E53FDA,$CACA61AB,$F4F41DE9,$E9E927CE,
    $6363C6A5,$12122436,$C2C271B3,$A6A6B91F,$1414283C,$BCBC8D31,$D3D35380,$28285078,
    $AFAFAB04,$2F2F5E71,$E6E639DF,$2424486C,$5252A4F6,$C6C679BF,$A0A0B515,$0909121B,
    $BDBD8F32,$8C8CED61,$CFCF6BA4,$5D5DBAE7,$11112233,$5F5FBEE1,$01010203,$C5C57FBA,
    $9F9FCB54,$3D3D7A47,$A2A2B113,$9B9BC358,$C9C967AE,$3B3B764D,$BEBE8937,$5151A2F3,
    $1919322B,$1F1F3E21,$3F3F7E41,$5C5CB8E4,$B2B29123,$EFEF2BC4,$4A4A94DE,$CDCD6FA2,
    $BFBF8B34,$BABA813B,$6F6FDEB1,$6464C8AC,$D9D9479E,$F3F313E0,$3E3E7C42,$B4B49D29,
    $AAAAA10B,$DCDC4D91,$D5D55F8A,$06060C0A,$C0C075B5,$7E7EFC82,$F6F619EF,$6666CCAA,
    $6C6CD8B4,$8484FD79,$7171E293,$38387048,$B9B9873E,$1D1D3A27,$7F7FFE81,$9D9DCF52,
    $484890D8,$8B8BE368,$2A2A547E,$DADA419B,$A5A5BF1A,$33336655,$8282F173,$3939724B,
    $D6D6598F,$7878F088,$8686F97F,$FAFA01FB,$E4E43DD9,$2B2B567D,$A9A9A70E,$1E1E3C22,
    $8989E76E,$6060C0A0,$6B6BD6BD,$EAEA21CB,$5555AAFF,$4C4C98D4,$F7F71BEC,$E2E231D3),
   ($B19726B1,$CE69A7CE,$C373B0C3,$95DF4A95,$5AB4EE5A,$ADAF02AD,$E73BDCE7,$02040602,
    $4D9AD74D,$4488CC44,$FB03F8FB,$91D74691,$0C18140C,$87FB7C87,$A1B716A1,$50A0F050,
    $CB63A8CB,$67CEA967,$54A8FC54,$DD4F92DD,$468CCA46,$8FEB648F,$E137D6E1,$4E9CD24E,
    $F015E5F0,$FD0FF2FD,$FC0DF1FC,$EB23C8EB,$F907FEF9,$C47DB9C4,$1A342E1A,$6EDCB26E,
    $5EBCE25E,$F51FEAF5,$CC6DA1CC,$8DEF628D,$1C38241C,$56ACFA56,$4386C543,$FE09F7FE,
    $070E0907,$61C2A361,$F805FDF8,$75EA9F75,$59B2EB59,$FF0BF4FF,$03060503,$22446622,
    $8AE16B8A,$D15786D1,$13263513,$EE29C7EE,$88E56D88,$00000000,$0E1C120E,$34685C34,
    $152A3F15,$80F57580,$94DD4994,$E333D0E3,$ED2FC2ED,$B59F2AB5,$53A6F553,$23466523,
    $4B96DD4B,$478EC947,$172E3917,$A7BB1CA7,$90D54590,$356A5F35,$ABA308AB,$D8459DD8,
    $B8853DB8,$DF4B94DF,$4F9ED14F,$57AEF957,$9AC15B9A,$92D14392,$DB4398DB,$1B362D1B,
    $3C78443C,$C865ADC8,$99C75E99,$04080C04,$8EE9678E,$E035D5E0,$D75B8CD7,$7DFA877D,
    $85FF7A85,$BB8338BB,$4080C040,$2C58742C,$3A744E3A,$458ACF45,$F117E6F1,$4284C642,
    $65CAAF65,$20406020,$4182C341,$18302818,$72E49672,$254A6F25,$93D34093,$70E09070,
    $366C5A36,$050A0F05,$F211E3F2,$0B161D0B,$A3B310A3,$79F28B79,$EC2DC1EC,$08101808,
    $274E6927,$31625331,$32645632,$B6992FB6,$7CF8847C,$B09525B0,$0A141E0A,$73E69573,
    $5BB6ED5B,$7BF68D7B,$B79B2CB7,$81F77681,$D25183D2,$0D1A170D,$6AD4BE6A,$264C6A26,
    $9EC9579E,$58B0E858,$9CCD519C,$83F37083,$74E89C74,$B39320B3,$ACAD01AC,$30605030,
    $7AF48E7A,$69D2BB69,$77EE9977,$0F1E110F,$AEA907AE,$21426321,$DE4997DE,$D05585D0,
    $2E5C722E,$97DB4C97,$10203010,$A4BD19A4,$98C55D98,$A8A50DA8,$D45D89D4,$68D0B868,
    $2D5A772D,$62C4A662,$29527B29,$6DDAB76D,$162C3A16,$4992DB49,$76EC9A76,$C77BBCC7,
    $E825CDE8,$C177B6C1,$96D94F96,$376E5937,$E53FDAE5,$CA61ABCA,$F41DE9F4,$E927CEE9,
    $63C6A563,$12243612,$C271B3C2,$A6B91FA6,$14283C14,$BC8D31BC,$D35380D3,$28507828,
    $AFAB04AF,$2F5E712F,$E639DFE6,$24486C24,$52A4F652,$C679BFC6,$A0B515A0,$09121B09,
    $BD8F32BD,$8CED618C,$CF6BA4CF,$5DBAE75D,$11223311,$5FBEE15F,$01020301,$C57FBAC5,
    $9FCB549F,$3D7A473D,$A2B113A2,$9BC3589B,$C967AEC9,$3B764D3B,$BE8937BE,$51A2F351,
    $19322B19,$1F3E211F,$3F7E413F,$5CB8E45C,$B29123B2,$EF2BC4EF,$4A94DE4A,$CD6FA2CD,
    $BF8B34BF,$BA813BBA,$6FDEB16F,$64C8AC64,$D9479ED9,$F313E0F3,$3E7C423E,$B49D29B4,
    $AAA10BAA,$DC4D91DC,$D55F8AD5,$060C0A06,$C075B5C0,$7EFC827E,$F619EFF6,$66CCAA66,
    $6CD8B46C,$84FD7984,$71E29371,$38704838,$B9873EB9,$1D3A271D,$7FFE817F,$9DCF529D,
    $4890D848,$8BE3688B,$2A547E2A,$DA419BDA,$A5BF1AA5,$33665533,$82F17382,$39724B39,
    $D6598FD6,$78F08878,$86F97F86,$FA01FBFA,$E43DD9E4,$2B567D2B,$A9A70EA9,$1E3C221E,
    $89E76E89,$60C0A060,$6BD6BD6B,$EA21CBEA,$55AAFF55,$4C98D44C,$F71BECF7,$E231D3E2),
   ($9726B1B1,$69A7CECE,$73B0C3C3,$DF4A9595,$B4EE5A5A,$AF02ADAD,$3BDCE7E7,$04060202,
    $9AD74D4D,$88CC4444,$03F8FBFB,$D7469191,$18140C0C,$FB7C8787,$B716A1A1,$A0F05050,
    $63A8CBCB,$CEA96767,$A8FC5454,$4F92DDDD,$8CCA4646,$EB648F8F,$37D6E1E1,$9CD24E4E,
    $15E5F0F0,$0FF2FDFD,$0DF1FCFC,$23C8EBEB,$07FEF9F9,$7DB9C4C4,$342E1A1A,$DCB26E6E,
    $BCE25E5E,$1FEAF5F5,$6DA1CCCC,$EF628D8D,$38241C1C,$ACFA5656,$86C54343,$09F7FEFE,
    $0E090707,$C2A36161,$05FDF8F8,$EA9F7575,$B2EB5959,$0BF4FFFF,$06050303,$44662222,
    $E16B8A8A,$5786D1D1,$26351313,$29C7EEEE,$E56D8888,$00000000,$1C120E0E,$685C3434,
    $2A3F1515,$F5758080,$DD499494,$33D0E3E3,$2FC2EDED,$9F2AB5B5,$A6F55353,$46652323,
    $96DD4B4B,$8EC94747,$2E391717,$BB1CA7A7,$D5459090,$6A5F3535,$A308ABAB,$459DD8D8,
    $853DB8B8,$4B94DFDF,$9ED14F4F,$AEF95757,$C15B9A9A,$D1439292,$4398DBDB,$362D1B1B,
    $78443C3C,$65ADC8C8,$C75E9999,$080C0404,$E9678E8E,$35D5E0E0,$5B8CD7D7,$FA877D7D,
    $FF7A8585,$8338BBBB,$80C04040,$58742C2C,$744E3A3A,$8ACF4545,$17E6F1F1,$84C64242,
    $CAAF6565,$40602020,$82C34141,$30281818,$E4967272,$4A6F2525,$D3409393,$E0907070,
    $6C5A3636,$0A0F0505,$11E3F2F2,$161D0B0B,$B310A3A3,$F28B7979,$2DC1ECEC,$10180808,
    $4E692727,$62533131,$64563232,$992FB6B6,$F8847C7C,$9525B0B0,$141E0A0A,$E6957373,
    $B6ED5B5B,$F68D7B7B,$9B2CB7B7,$F7768181,$5183D2D2,$1A170D0D,$D4BE6A6A,$4C6A2626,
    $C9579E9E,$B0E85858,$CD519C9C,$F3708383,$E89C7474,$9320B3B3,$AD01ACAC,$60503030,
    $F48E7A7A,$D2BB6969,$EE997777,$1E110F0F,$A907AEAE,$42632121,$4997DEDE,$5585D0D0,
    $5C722E2E,$DB4C9797,$20301010,$BD19A4A4,$C55D9898,$A50DA8A8,$5D89D4D4,$D0B86868,
    $5A772D2D,$C4A66262,$527B2929,$DAB76D6D,$2C3A1616,$92DB4949,$EC9A7676,$7BBCC7C7,
    $25CDE8E8,$77B6C1C1,$D94F9696,$6E593737,$3FDAE5E5,$61ABCACA,$1DE9F4F4,$27CEE9E9,
    $C6A56363,$24361212,$71B3C2C2,$B91FA6A6,$283C1414,$8D31BCBC,$5380D3D3,$50782828,
    $AB04AFAF,$5E712F2F,$39DFE6E6,$486C2424,$A4F65252,$79BFC6C6,$B515A0A0,$121B0909,
    $8F32BDBD,$ED618C8C,$6BA4CFCF,$BAE75D5D,$22331111,$BEE15F5F,$02030101,$7FBAC5C5,
    $CB549F9F,$7A473D3D,$B113A2A2,$C3589B9B,$67AEC9C9,$764D3B3B,$8937BEBE,$A2F35151,
    $322B1919,$3E211F1F,$7E413F3F,$B8E45C5C,$9123B2B2,$2BC4EFEF,$94DE4A4A,$6FA2CDCD,
    $8B34BFBF,$813BBABA,$DEB16F6F,$C8AC6464,$479ED9D9,$13E0F3F3,$7C423E3E,$9D29B4B4,
    $A10BAAAA,$4D91DCDC,$5F8AD5D5,$0C0A0606,$75B5C0C0,$FC827E7E,$19EFF6F6,$CCAA6666,
    $D8B46C6C,$FD798484,$E2937171,$70483838,$873EB9B9,$3A271D1D,$FE817F7F,$CF529D9D,
    $90D84848,$E3688B8B,$547E2A2A,$419BDADA,$BF1AA5A5,$66553333,$F1738282,$724B3939,
    $598FD6D6,$F0887878,$F97F8686,$01FBFAFA,$3DD9E4E4,$567D2B2B,$A70EA9A9,$3C221E1E,
    $E76E8989,$C0A06060,$D6BD6B6B,$21CBEAEA,$AAFF5555,$98D44C4C,$1BECF7F7,$31D3E2E2)
  );

{$IFDEF RESTORE_RANGECHECKS}{$R+}{$ENDIF}
{$IFDEF RESTORE_OVERFLOWCHECKS}{$Q+}{$ENDIF}

implementation

end.
