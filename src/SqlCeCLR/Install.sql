-- Configuration Region

--ALTER DATABASE [MyDatabase] SET TRUSTWORTHY ON;
--GO
--EXEC sp_configure 'clr enabled', '1';
--GO
--RECONFIGURE
--GO

-- Clean up Region
IF EXISTS (SELECT * FROM sys.objects WHERE ([name] = N'GetTable'))
DROP PROC GetTable;
GO

IF EXISTS (SELECT [name] FROM sys.assemblies WHERE [name] = N'SqlCeCLR')
DROP ASSEMBLY SqlCeCLR;
GO

-- Install Region

-- Modify path according to your environment
--CREATE ASSEMBLY SqlCeCLR
--FROM 'C:\Users\eejj\Downloads\SqlCeCLR\bin\Debug\SqlCeCLR.dll'
--WITH permission_set = unsafe;
--GO

-- No file required!
CREATE ASSEMBLY [SqlCeCLR]
FROM 0x4D5A90000300000004000000FFFF0000B800000000000000400000000000000000000000000000000000000000000000000000000000000000000000800000000E1FBA0E00B409CD21B8014CCD21546869732070726F6772616D2063616E6E6F742062652072756E20696E20444F53206D6F64652E0D0D0A2400000000000000504500004C01030040FD99570000000000000000E00022200B013000002400000006000000000000FA43000000200000006000000000001000200000000200000400000000000000040000000000000000A000000002000000000000030040850000100000100000000010000010000000000000100000000000000000000000A84300004F000000006000007803000000000000000000000000000000000000008000000C000000704200001C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200000080000000000000000000000082000004800000000000000000000002E7465787400000000240000002000000024000000020000000000000000000000000000200000602E7273726300000078030000006000000004000000260000000000000000000000000000400000402E72656C6F6300000C0000000080000000020000002A00000000000000000000000000004000004200000000000000000000000000000000DC4300000000000048000000020005004C2D00002415000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001B3006003B0500000100001100160A731200000A0B02731300000A0C00086F1400000A00731500000A130600110672010000706F1600000A0011066F1700000A72E000007020CA0000002080000000731800000A6F1900000A2611066F1700000A166F1A00000A036F1B00000A001106086F1C00000A0011066F1D00000A130700388500000000281E00000A14FE03130811082C18281E00000A1107176F1F00000A6F2000000A6F2100000A001107176F1F00000A6F2000000A72E8000070282200000A2D191107176F1F00000A6F2000000A72F4000070282200000A2B0117130911092C022B230617580A0772000100701107166F1F00000A7204010070282300000A6F2400000A000011072C0911076F2500000A2B0116130A110A3A64FFFFFF00DE0D11072C0811076F2600000A00DC00DE0D11062C0811066F2600000A00DC0616FE01130B110B2C2400281E00000A14FE03130C110C2C10281E00000A72080100706F2100000A00DDD603000006030828040000060D09732700000A1304732800000A130500076F2900000A130D2B22120D282A00000A130E001105110E6F2B00000A26110572560100706F2B00000A2600120D282C00000A2DD5DE0F120DFE160200001B6F2600000A00DC110511056F2D00000A1859186F2E00000A261B8D100000012516725C010070A225171105A22518726C010070A2251903A2251A7204010070A2282F00000A08733000000A130F00110F6F1D00000A131000281E00000A14FE031311111139E002000000281E00000A110F6F3100000A6F2100000A00281E00000A11046F3200000A00388502000000161312385A02000000111011126F3300000A131311132C1100110411126F3400000A00003832020000000911129A6F3500000A18FE01131411142C150011041112111011126F3600000A6F3700000A00000911129A6F3500000A1F14FE01131511152C150011041112111011126F3800000A6F3900000A00000911129A6F3500000A1F10FE01131611162C150011041112111011126F3A00000A6F3B00000A00000911129A6F3500000A1EFE01131711172C150011041112111011126F3C00000A6F3D00000A00000911129A6F3500000A16FE01131811182C150011041112111011126F3E00000A6F3F00000A00000911129A6F3500000A1F0C2E0F0911129A6F3500000A1F0AFE012B0117131911192C150011041112111011126F4000000A6F4100000A00000911129A6F3500000A1F0EFE01131A111A2C150011041112111011126F4200000A6F4300000A00000911129A6F3500000A1F132E1B0911129A6F3500000A172E0F0911129A6F3500000A1F15FE012B0117131B111B2C2500111011126F1F00000A740300001B131C11041112166A111C16111C8E696F4400000A00000911129A6F3500000A1AFE01131D111D2C150011041112111011126F4500000A6F4600000A00000911129A6F3500000A1F092E0E0911129A6F3500000A1BFE012B0117131E111E2C150011041112111011126F4700000A6F4800000A00000911129A6F3500000A1CFE01131F111F2C150011041112111011126F4900000A6F4A00000A00000911129A6F3500000A1F0DFE01132011202C1F0011041112111011126F4B00000A284C00000A284D00000A6F4E00000A00000000111217581312111211106F4F00000AFE04132111213A92FDFFFF281E00000A11046F5000000A000011102C0911106F2500000A2B0116132211223A64FDFFFF111014FE03132311232C0811106F5100000A00281E00000A6F5200000A000000DE0D11102C0811106F2600000A00DC00DE0D110F2C08110F6F2600000A00DC086F5300000A0000DE0B082C07086F2600000A00DC2A00419400000200000074000000A5000000190100000D00000000000000020000001F0000000A010000290100000D0000000000000002000000850100002F000000B40100000F000000000000000200000013020000F5020000080500000D0000000000000002000000090200000F030000180500000D0000000000000002000000100000001F0500002F0500000B000000000000001B3002004A0000000200001100727C01007002285400000A731300000A0A00066F1400000A0072D201007006733000000A0B00071F206F5500000A0CDE16072C07076F2600000A00DC062C07066F2600000A00DC082A0000011C0000020026000C32000B00000000020012002B3D000B000000001330030057000000030000110002741F0000010A160B0306076F5600000A2D0E06076F5700000A735800000A2B057E5900000A811D0000010717580B0406076F5600000A2D0E06076F5A00000A735B00000A2B057E5C00000A811E0000010717580B2A001B300700CA0500000400001100028D140000010A160B731500000A0C0008723E0200706F1600000A00086F1700000A72E000007020CA0000002080000000731800000A6F1900000A26086F1700000A166F1A00000A036F1B00000A0008046F1C00000A00086F1D00000A0D00382C0500000009176F1F00000A6F2000000A72E8000070285D00000A2C1809176F1F00000A6F2000000A72F4000070285D00000A2B01161304110439F00400000009176F1F00000A6F2000000A130511052805000006130611062075C7349B429700000011062068A4F8683547110620BE74C85B351F11062044C5BD2C3B8E0100002B00110620BE74C85B3BEE010000389A04000011062030E2CA603B590100002B0011062068A4F8683BFB010000387B040000110620CAA5678A351F11062015329D813BC30000002B00110620CAA5678A3B4F01000038530400001106205E7EE9953BBA0000002B0011062075C7349B3BE00100003834040000110620906DEACC3547110620C7688DC7351F110620855DC4A63BB50000002B00110620C7688DC73B2B0100003803040000110620758389CC3B040100002B00110620906DEACC3B7A01000038E4030000110620FC6C85DD351C1106205DB0DFD62E5B2B00110620FC6C85DD3BFD00000038BF030000110620693033E03B180100002B001106204FC950E12E5D38A303000011057295030070282200000A3A4F010000388D030000110572A7030070282200000A3A580100003877030000110572AF030070282200000A3A600100003861030000110572B9030070282200000A3A69010000384B030000110572C5030070282200000A3A710100003835030000110572D1030070282200000A3A7A010000381F030000110572D9030070282200000A3A820100003809030000110572E9030070282200000A3A8B01000038F3020000110572F7030070282200000A3A9301000038DD02000011057219040070282200000A3A9C01000038C70200001105722D040070282200000A3AB601000038B10200001105723B040070282200000A3ACF010000389B0200001105724D040070282200000A3AE9010000388502000011057259040070282200000A3A00020000386F02000011057269040070282200000A3A2702000038590200001105727B040070282200000A3A2C0200003843020000060709166F1F00000A6F2000000A1F10735E00000AA20717580B3824020000060709166F1F00000A6F2000000A1E735E00000AA20717580B3806020000060709166F1F00000A6F2000000A1F0D735E00000AA20717580B38E7010000060709166F1F00000A6F2000000A1C735E00000AA20717580B38C9010000060709166F1F00000A6F2000000A1F09735E00000AA20717580B38AA010000060709166F1F00000A6F2000000A18735E00000AA20717580B388C010000060709166F1F00000A6F2000000A1F14735E00000AA20717580B386D010000060709166F1F00000A6F2000000A16735E00000AA20717580B384F010000060709166F1F00000A6F2000000A1F0E735E00000AA20717580B3830010000060709166F1F00000A6F2000000A1F1509186F1F00000A6F2000000A285F00000A736000000AA20717580B3800010000060709166F1F00000A6F2000000A1709186F1F00000A6F2000000A285F00000A736000000AA20717580B38D1000000060709166F1F00000A6F2000000A1F0C09186F1F00000A6F2000000A285F00000A736000000AA20717580B38A1000000060709166F1F00000A6F2000000A1F0A09186F1F00000A6F2000000A285F00000A736000000AA20717580B2B74060709166F1F00000A6F2000000A1B09196F1F00000A6F2000000A286100000A091A6F1F00000A6F2000000A286100000A736200000AA20717580B2B37060709166F1F00000A6F2000000A1A735E00000AA20717580B2B1C060709166F1F00000A6F2000000A1F13735E00000AA20717580B2B000000092C08096F2500000A2B0116130711073ABFFAFFFF00DE0B092C07096F2600000A00DC00DE0B082C07086F2600000A00DC0613082B0011082A000041340000020000005F0000004A050000A90500000B000000000000000200000010000000A7050000B70500000B00000000000000133002002E00000005000011022C2920C59D1C810A160B2B1402076F6300000A066120930100015A0A0717580B07026F6400000A2F022BE1062A000042534A4201000100000000000C00000076342E302E33303331390000000005006C00000034050000237E0000A00500002C07000023537472696E677300000000CC0C000094040000235553006011000010000000234755494400000070110000B403000023426C6F620000000000000002000001471502080900000000FA013300160000010000003200000003000000050000000A0000006400000011000000050000000300000001000000020000000000850401000000000006004003DE050600AD03DE0506004902AC050F00FE05000006007102D50406002303D5040600EF02D50406009403D50406006003D50406007903D50406009E02D50406005D02BF0506003B02BF050600D202D5040600B902FC0306006806AE040A0088026D0506000100BF000A000F05A4000A008C006D050A003D016D0506005005C2060A000801A4000A003205A4004B009B0500000A000E036D050A0021016D0506007D012B060A0008000D060A0016040D060A0030011F0506002002DE050A0012051F050A000B011F050A00E704A4000A005E05A4000A00FA01A4000A0061051F050A00EE066D050A00F2016D050A0035051F0506004704AE0406008901AE040A00080280000600F400AE040600E001AE0406007D04AE040600B106AE040A00AC010D060A0088058000000000004F0000000000010001008101100057064B01410001000100000100005800000041000100050050200000000096007401FD0101002C26000000009600580103020300A026000000009100F906090204000427000000009100980014020700102D0000000093004E041E020A0000000100200400000200BF01000001006901000001006B0402000200DA0002000300C90100000100870600000200BF0100000300D004000001005F060900A60501001100A60506001900A6050A002900A60510003100A60510003900A60510004100A60510004900A60510005100A60510005900A60510006100A60515006900A60510007100A60510007900A60510008900A6050600D100A60506000101A60506000C00A60506009900A60510000901CB040600B900A60506001101DE061000B900480659002101A6055F001901E50068001901A50471003101E2037800B90000057D00B900420583003901E90188004901A5048E00810031049300410115011000510110079700510161069D000C00E500A4004901E000AA00590118020600A900A605AE00B100A60506000C009805B50014007B06C400B1001A01C9001400B906AA00B1006004CF00B100F503D30051016106DA00B900A605E0001101CE0693004101A006E70049019204ED00A9009B040100A1000402F2004901B504ED00A900C004F8004901D203FE00A900DA03030149013D000901A90046000E01490111001401A9001A00190149012B001F01A9003400240149013A042A01A90044042F014901E9003501A900F1003C01A900220647014901D1015101A900DD01580149016F046001A9007A046701490195016F01A9009F0174014901EC038E008101B6017A0189016F067F01A900A901860149019106CF0041010107E7004901120206004101F9000600090112020600510161069701B90042059D01F9009204ED00F90011001401E900A6050100E900A004AB01F9003A042A01F100A6051000F100A004AF0151011C079700A100A605C50181012300CD01A100A605D2018101CB03DB01A100A605E00151013E06EF0151016004CF0020007B00FF022E000B0023022E0013002C022E001B004B022E00230054022E002B0062022E00330062022E003B0062022E00430054022E004B0068022E00530062022E005B0062022E00630080022E006B00AA022E007300B70240008300040363008B00FF021A008E01A501B301EA015300BE00440104800000010000000000000000000000000077000000040000000000000000000000F401B60000000000040000000000000000000000F4018000000000000000004C69737460310053716C496E74333200476574496E74333200536574496E74333200546F496E74363400476574496E74363400536574496E74363400476574496E74313600536574496E743136003C4D6F64756C653E003C50726976617465496D706C656D656E746174696F6E44657461696C733E0053716C4365434C520053797374656D2E446174610053716C4D65746144617461004765744D657461446174610053797374656D2E446174612E4F6C654462006D73636F726C69620053797374656D2E436F6C6C656374696F6E732E47656E65726963006361744964005265616400416464004765744775696400536574477569640053656E64526573756C7473456E64004F6C654462436F6D6D616E640053656E6400417070656E6400446174614163636573734B696E64004462446174615265636F72640053716C446174615265636F7264004572696B454A2E53716C4365004765744461746146726F6D53716C43650064617461536F75726365004765745461626C650049456E756D657261626C650049446973706F7361626C6500476574446F75626C6500536574446F75626C650053657453716C53696E676C6500546F53696E676C65007461626C654E616D65006361744E616D65004765744461746554696D65005365744461746554696D65006765745F506970650053716C50697065004F6C65446254797065006765745F53716C44625479706500436C6F736500446973706F736500436F6D70696C657247656E65726174656441747472696275746500477569644174747269627574650044656275676761626C6541747472696275746500436F6D56697369626C6541747472696275746500417373656D626C795469746C654174747269627574650053716C50726F63656475726541747472696275746500417373656D626C7954726164656D61726B417474726962757465005461726765744672616D65776F726B41747472696275746500417373656D626C7946696C6556657273696F6E41747472696275746500417373656D626C79436F6E66696775726174696F6E4174747269627574650053716C46756E6374696F6E41747472696275746500417373656D626C794465736372697074696F6E41747472696275746500436F6D70696C6174696F6E52656C61786174696F6E7341747472696275746500417373656D626C7950726F6475637441747472696275746500417373656D626C79436F7079726967687441747472696275746500417373656D626C79436F6D70616E794174747269627574650052756E74696D65436F6D7061746962696C69747941747472696275746500546F4279746500476574427974650053657442797465007365745F56616C75650047657456616C75650052656D6F76650053797374656D2E52756E74696D652E56657273696F6E696E670053716C537472696E6700636F6E6E656374696F6E537472696E6700546F537472696E6700476574537472696E6700536574537472696E6700436F6D70757465537472696E6748617368006765745F4C656E677468006F626A00476574446563696D616C00536574446563696D616C0053716C4365434C522E646C6C00497344424E756C6C0053657444424E756C6C006765745F4974656D0053797374656D00476574426F6F6C65616E00536574426F6F6C65616E004F70656E00636F6E6E0053797374656D2E5265666C656374696F6E004F6C654462506172616D65746572436F6C6C656374696F6E007365745F436F6E6E656374696F6E004F6C654462436F6E6E656374696F6E0053797374656D2E446174612E436F6D6D6F6E004F6C65446244617461526561646572004578656375746552656164657200537472696E674275696C646572004F6C654462506172616D65746572004D6963726F736F66742E53716C5365727665722E53657276657200436F6D6D616E644265686176696F7200476574456E756D657261746F72002E63746F720053797374656D2E446961676E6F73746963730053797374656D2E52756E74696D652E496E7465726F7053657276696365730053797374656D2E52756E74696D652E436F6D70696C6572536572766963657300446562756767696E674D6F6465730053797374656D2E446174612E53716C54797065730053657442797465730053797374656D2E436F6C6C656374696F6E73006765745F4368617273006765745F506172616D657465727300436C7241636365737300436F6E636174004F626A656374006F705F496D706C69636974006765745F43757272656E74006D657461436F756E74006765745F4669656C64436F756E740053656E64526573756C7473537461727400436F6E76657274004D6F76654E6578740053797374656D2E54657874006765745F436F6D6D616E6454657874007365745F436F6D6D616E64546578740053716C436F6E746578740046696C6C526F770053656E64526573756C7473526F77006F705F457175616C697479006F705F496E657175616C6974790000000080DD530045004C00450043005400200043004F004C0055004D004E005F004E0041004D0045002C00200044004100540041005F0054005900500045002000460052004F004D00200049004E0046004F0052004D004100540049004F004E005F0053004300480045004D0041002E0043004F004C0055004D004E00530020005700480045005200450020005400410042004C0045005F004E0041004D00450020003D00200040007000310020004F00520044004500520020004200590020004F005200440049004E0041004C005F0050004F0053004900540049004F004E000007400070003100000B6E007400650078007400000B69006D0061006700650000035B0000035D00004D4E006F0020006400610074006100200066006F0075006E0064002C0020006F00720020007400610062006C006500200064006F006500730020006E006F00740020006500780069007300740000052C002000000F530045004C004500430054002000000F2000460052004F004D0020005B000055500072006F00760069006400650072003D004D006900630072006F0073006F00660074002E00530051004C005300450052005600450052002E00430045002E004F004C004500440042002E0034002E0030003B00006B530045004C0045004300540020005B00430061007400650067006F00720079002000490064005D002C0020005B00430061007400650067006F007200790020004E0061006D0065005D002000460052004F004D002000430061007400650067006F007200690065007300008155530045004C00450043005400200043004F004C0055004D004E005F004E0041004D0045002C00200044004100540041005F0054005900500045002C0020004300480041005200410043005400450052005F004D004100580049004D0055004D005F004C0045004E004700540048002C0020004E0055004D0045005200490043005F0050005200450043004900530049004F004E002C0020004E0055004D0045005200490043005F005300430041004C0045002000460052004F004D00200049004E0046004F0052004D004100540049004F004E005F0053004300480045004D0041002E0043004F004C0055004D004E00530020005700480045005200450020005400410042004C0045005F004E0041004D00450020003D00200040007000310020004F00520044004500520020004200590020004F005200440049004E0041004C005F0050004F0053004900540049004F004E00001173006D0061006C006C0069006E007400000769006E00740000097200650061006C00000B66006C006F0061007400000B6D006F006E00650079000007620069007400000F740069006E00790069006E007400000D62006900670069006E007400002175006E0069007100750065006900640065006E007400690066006900650072000013760061007200620069006E00610072007900000D620069006E0061007200790000116E007600610072006300680061007200000B6E006300680061007200000F6E0075006D00650072006900630000116400610074006500740069006D006500001572006F007700760065007200730069006F006E0000000000B55684CC5B1926449943248B827CC85400042001010803200001052001011111042001010E042001010238072408151249010E124D1D125112551259125D12610202020202151165010E0E125D126102080202020202020202021D050202020202020205151249010E05200012808D082003010E1180950808200112809112809106200112809108042001011C05200101124D04200012610500001280A10420011C080320000E050002020E0E0600030E1C1C1C05200101130003200002062001011D125108200015116501130005151165010E042000130005200112590E03200008062002125908080500010E1D1C062002010E124D05200101125504200102080520001180B10520020108020420010508052002010805042001060805200201080604200108080520020108080420010A0805200201080A0420010E0805200201080E0620011180B50807200201081180B5021D0509200501080A1D0508080620011180B90807200201081180B90620011180BD0807200201081180BD0420010D0805200201080D0400010C1C0600011180C50C07200201081180C5080703124D125D12710500020E0E0E07200112611180C9050702127D0803061175030611791107091D125108125D1261020E09021D1251072002010E1180B10400010A0E082003010E1180B10A040001050E092004010E1180B105050407020908042001030808B77A5C561934E089050002010E0E05000112710E0A0003011C1011751011790900031D1251080E124D040001090E0801000800000000001E01000100540216577261704E6F6E457863657074696F6E5468726F7773010801000701000000000D01000853716C4365434C52000005010000000017010012436F7079726967687420C2A920203230303800002901002438613763636532372D626661632D343539372D393539332D33326630343961393764383400000C010007312E302E302E3000004701001A2E4E45544672616D65776F726B2C56657273696F6E3D76342E300100540E144672616D65776F726B446973706C61794E616D65102E4E4554204672616D65776F726B2034040100000080AB01000200540E1146696C6C526F774D6574686F644E616D650746696C6C526F775455794D6963726F736F66742E53716C5365727665722E5365727665722E446174614163636573734B696E642C2053797374656D2E446174612C2056657273696F6E3D342E302E302E302C2043756C747572653D6E65757472616C2C205075626C69634B6579546F6B656E3D623737613563353631393334653038390A44617461416363657373010000000000000000000040FD995700000000020000001C0100008C4200008C24000052534453A757F983A69A6F48BE50A1486D45DF8501000000433A5C55736572735C65656A6A5C446F776E6C6F6164735C53716C4365434C525C6F626A5C44656275675C53716C4365434C522E70646200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000D04300000000000000000000EA430000002000000000000000000000000000000000000000000000DC430000000000000000000000005F436F72446C6C4D61696E006D73636F7265652E646C6C0000000000FF2500200010000000000000000000000000000001001000000018000080000000000000000000000000000001000100000030000080000000000000000000000000000001000000000048000000586000001C03000000000000000000001C0334000000560053005F00560045005200530049004F004E005F0049004E0046004F0000000000BD04EFFE00000100000001000000000000000100000000003F000000000000000400000002000000000000000000000000000000440000000100560061007200460069006C00650049006E0066006F00000000002400040000005400720061006E0073006C006100740069006F006E00000000000000B0047C020000010053007400720069006E006700460069006C00650049006E0066006F0000005802000001003000300030003000300034006200300000001A000100010043006F006D006D0065006E007400730000000000000022000100010043006F006D00700061006E0079004E0061006D00650000000000000000003A0009000100460069006C0065004400650073006300720069007000740069006F006E0000000000530071006C004300650043004C00520000000000300008000100460069006C006500560065007200730069006F006E000000000031002E0030002E0030002E00300000003A000D00010049006E007400650072006E0061006C004E0061006D0065000000530071006C004300650043004C0052002E0064006C006C00000000004800120001004C006500670061006C0043006F007000790072006900670068007400000043006F0070007900720069006700680074002000A90020002000320030003000380000002A00010001004C006500670061006C00540072006100640065006D00610072006B007300000000000000000042000D0001004F0072006900670069006E0061006C00460069006C0065006E0061006D0065000000530071006C004300650043004C0052002E0064006C006C0000000000320009000100500072006F0064007500630074004E0061006D00650000000000530071006C004300650043004C00520000000000340008000100500072006F006400750063007400560065007200730069006F006E00000031002E0030002E0030002E003000000038000800010041007300730065006D0062006C0079002000560065007200730069006F006E00000031002E0030002E0030002E00300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000000C000000FC3300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
WITH PERMISSION_SET = UNSAFE
GO

CREATE PROCEDURE GetTable(@connectionstring nvarchar(256), @tableName nvarchar(128))
AS EXTERNAL NAME SqlCeCLR.[ErikEJ.SqlCe.ClrAccess].GetTable
go

-- Test Region

--use: "Provider=Microsoft.SQLSERVER.MOBILE.OLEDB.3.0;OLE DB Services=-4;" for SQL Compact 3.1
--use: "Provider=Microsoft.SQLSERVER.CE.OLEDB.3.5;OLE DB Services=-4;" for SQL Compact 3.5 SP2
--use: "Provider=Microsoft.SQLSERVER.CE.OLEDB.4.0;OLE DB Services=-4;" for SQL Compact 4.0

--CREATE TABLE dbo.Shippers
--(
--[Shipper Id] int, [Company Name] nvarchar(40)
--);
--GO

--INSERT INTO dbo.Shippers
--EXEC dbo.GetTable 'Provider=Microsoft.SQLSERVER.CE.OLEDB.4.0;OLE DB Services=-4;Data Source=C:\Code\temp\Northwind40.sdf', 'Shippers'
--GO
