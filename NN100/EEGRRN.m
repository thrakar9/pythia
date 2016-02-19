function [Y,Xf,Af] = EEGRRN(X,Xi,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 12-Feb-2015 19:12:12.
% 
% [Y,Xf,Af] = myNeuralNetworkFunction(X,Xi,~) takes these arguments:
% 
%   X = 2xTS cell, 2 inputs over TS timsteps
%   Each X{1,ts} = 25xQ matrix, input #1 at timestep ts.
%   Each X{2,ts} = 1xQ matrix, input #2 at timestep ts.
% 
%   Xi = 2x4 cell 2, initial 4 input delay states.
%   Each Xi{1,ts} = 25xQ matrix, initial states for input #1.
%   Each Xi{2,ts} = 1xQ matrix, initial states for input #2.
% 
%   Ai = 2x0 cell 2, initial 4 layer delay states.
%   Each Ai{1,ts} = 10xQ matrix, initial states for layer #1.
%   Each Ai{2,ts} = 1xQ matrix, initial states for layer #2.
% 
% and returns:
%   Y = 1xTS cell of 2 outputs over TS timesteps.
%   Each Y{1,ts} = 1xQ matrix, output #1 at timestep ts.
% 
%   Xf = 2x4 cell 2, final 4 input delay states.
%   Each Xf{1,ts} = 25xQ matrix, final states for input #1.
%   Each Xf{2,ts} = 1xQ matrix, final states for input #2.
% 
%   Af = 2x0 cell 2, final 0 layer delay states.
%   Each Af{1ts} = 10xQ matrix, final states for layer #1.
%   Each Af{2ts} = 1xQ matrix, final states for layer #2.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

  % ===== NEURAL NETWORK CONSTANTS =====
  
  % Input 1
  x1_step1_xoffset = [-2.49915113534333;-2.13948596159315;-1.74759012495989;-2.23377870178649;-2.40140955994276;-2.95211995734922;-2.63835476950616;-2.11102628727829;-2.70688549556845;-2.55305557960259;-2.36050510531567;-2.39962753897284;-2.44924944064939;-2.36890107414674;-2.77782152653539;-2.86449868780414;-2.58718439898307;-2.41141531569661;-3.18777473411848;-2.09218405708499;-2.71688170433731;-2.05305946808411;-2.07587759765698;-3.05884694532218;-2.26951910837752];
  x1_step1_gain = [0.377267413463511;0.434998802464901;0.459760114246147;0.413281265056271;0.385083468515026;0.316573997123783;0.387534262385744;0.307265891185667;0.346272683918349;0.322312326116859;0.315856378479504;0.344446563800704;0.347529750398008;0.307918838371029;0.41440018876602;0.329092939489022;0.347452780863873;0.385865513751887;0.371835039870263;0.316459237810206;0.355037343713124;0.44999056280674;0.423383046117211;0.323073057704658;0.368280810715538];
  x1_step1_ymin = -1;
  
  % Input 2
  x2_step1_xoffset = 0;
  x2_step1_gain = 2;
  x2_step1_ymin = -1;
  
  % Layer 1
  b1 = [-1.8159224359291766;-1.1644059165950034;-0.80245275522609838;0.96431086262602383;-0.042393272928826796;1.1894179276640999;-0.78455720834045461;-1.0827286603644239;-0.79643584272558388;1.4227484099985179];
  IW1_1 = [0.11570513770335179 -0.2361134811617967 -0.098445590237022484 0.14366207826439564 0.1312372507213079 0.14020729724878281 -0.13550513811835632 0.045580602670249638 -0.12579819124380542 -0.035638285715894849 -0.15520092720720507 -0.028243834187708997 -0.089761145826288441 0.068570127227244343 0.016652043401182374 0.095897075305698715 -0.10667362901074436 -0.032771090800080768 -0.21195468561125452 -0.051970202142818729 0.20862166219779602 -0.062631076075669728 0.033475738547559683 0.12476425029020198 0.090494170966168644 -0.059653528316889061 -0.22999120373986179 -0.085589623041047377 0.13405348279733367 0.049136260571059645 -0.23729149082532686 -0.066333528819398871 -0.1180761728586244 -0.086435685461346154 0.0041059297462269486 0.18673489436589252 -0.2112890485042018 0.16103988177671291 0.055715552736088532 0.14079370952600423 -0.13706163201755844 0.077169632662371881 0.017711971136152437 -0.19694033833863381 -0.099233515519256105 -0.11431910838888705 0.070209217008041197 -0.050444987414896801 -0.0066276339623937558 -0.11029843654332584 -0.13124381861468964 -0.090659320113162495 -0.15926961722776775 -0.074535338855613198 -0.13694726674887436 0.10644122477371984 -0.37275627242923282 0.28770941448587611 -0.067266250969768071 0.0047622200787095382 0.0041639313982486477 -0.032221143279672335 0.013835664228517883 -0.15464148555095869 0.2059585500630077 0.021466239660923925 0.22089670672401107 -0.068762270382384957 -0.23661900195118521 0.082346769272867465 0.20933682249681426 0.18329988273550973 0.19441837226871861 -0.065666885687415605 -0.16834930180958943 -0.0087303186044694666 0.28684305586223974 0.17829857041315314 0.094541549308064854 0.029730672727778816 -0.043185719685621481 0.10299437976561229 0.24560715030716884 0.2581888777660718 -0.017812226026813982 -0.0026900549011686483 0.041409000481701784 -0.16321845646671584 -0.0092236349202269689 -0.041023974033080696 -0.15505660844440883 0.060512605984370235 -0.034679195013865967 0.093745098129188728 0.0083404818940493296 0.14734221470309622 0.0022618629691301441 0.18103724396625615 0.042997423391112538 -0.070771384298261311;0.026753166918341828 0.10908369645162037 -0.12031025430885006 0.01002238580303969 0.19840804574104898 -0.25725186519528576 -0.2003982273474515 0.23769378566657853 0.059183355224593955 -0.25276865949315624 0.09117062918793653 0.027465458002345025 -0.054939316420851148 0.22437719066521786 -0.050653450981720333 -0.04776832115374538 0.023837996796137031 0.21341878160409339 -0.25505544921647688 0.1408477700246312 0.024141808811183652 -0.19262061113089646 0.10264534372659308 -0.087719592792258536 -0.023083897136185156 -0.076975046837762434 0.12718312820799624 0.17610363597609827 -0.064865361849926167 0.13924051323353476 0.15579022079416782 0.18705240265452444 0.3044604050347417 0.12700174743197634 -0.0189810108908272 0.063597895447698477 0.11496802490588534 -0.11661740623252109 0.07832058892515828 -0.16276121321171491 -0.23228215337028846 0.055540751920367191 0.1179043274185846 -0.12122965416152182 0.021065433677413703 0.23003512215439922 0.022668002716586311 0.019381751767977799 0.086401128926661977 0.049286870228248958 -0.25439655918006526 -0.16186588722175196 -0.22479230043473589 0.086992268074702644 0.032036581701617384 0.1898364919004758 -0.21377567150033386 0.24016303474292627 0.12043867458254066 0.13797343110865437 0.1433423092009104 0.22716958848441324 0.051467759530421313 -0.045732148621442328 -0.13053978797239918 0.071539241157757616 -0.17697264196302057 0.0012103620602677665 0.22184574670011115 0.13923353697270907 -0.16313064915831937 0.2343176100095104 -0.058280152187489213 0.12975737991589725 0.024019307151173359 0.15036252863924057 -0.030928605039491953 -0.2217386936450173 0.11733560314021406 0.13069641442443117 -0.032581943823506043 0.047339030758667369 0.085473343571520213 -0.039061811427609942 0.17924556696142385 -0.045166433073542546 0.15946414980126053 -0.016999093441846178 0.026976912722785396 -0.060016171008031215 -0.26724803304618761 0.10991156034247367 0.17151516188658475 -0.079564613173820686 -0.065199619845898879 -0.10965536472570818 0.14007182058522855 -0.15494453057308905 0.17274536830111359 -0.064122490042405514;0.25859561202765818 0.009728241848843867 -0.059540872125653781 0.10745977144045475 0.11594318093250344 0.1136160988281807 -0.07512967890431313 -0.12313084041609192 -0.034401188403489096 0.067349295821626173 -0.060987182600255152 0.098569058513334307 -0.28046653901580382 -0.11662144339248115 0.22573220117607196 0.19160969395296948 -0.16179194880397324 0.14820290345513226 -0.035286375194384441 0.12753780353800545 0.0016614209823049859 -0.0084338871834978586 -0.1568204754143484 0.12753998462396471 -0.11724713561516155 -0.024598498816626024 0.02177678394173051 0.11260239213289883 0.087440699665282895 -0.11097523502203685 0.10388845721328054 -0.061963009003879743 0.072356736629201196 0.23462637134775804 -0.25890076722815342 -0.17434016790967727 0.15359985214041313 0.13911409299959607 -0.062646674850806161 -0.30126740894028681 -0.048374428061022642 -0.031109064625811117 0.089788850823675964 0.17919907772487276 0.042983911165968489 -0.16280085020982879 -0.14127534379150866 -0.22182295115698406 -0.058530961890396457 -0.20270812065245652 -0.23521125513871172 -0.39014806696330195 -0.022490063247222993 0.21000295872244898 0.19051742896039586 0.18013562090385002 -0.094226798109394452 -0.13003516248867147 0.20240780232330657 -0.17584418576377758 -0.015271988161440726 -0.11285412560447945 0.12569213075995536 0.047478842276631433 -0.24087920441435892 0.10228824321342703 -0.055264152651365785 0.36172346428162955 0.2337876259988802 0.26411564398868365 0.18428319501595142 -0.066435091035528568 -0.045701391587719631 -0.020017678103152827 -0.22507634960732539 -0.17995065128402724 -0.014017124604508335 0.24462225985635708 0.037150455609178304 -0.18772937988594204 -0.072515855904811785 0.11472874399908006 -0.081492097928706445 -0.12707606021175316 0.0040915862560532996 0.26413491335998607 -0.049860844856212214 -0.066242287773982098 0.20404578861737774 0.25652094516964841 -0.055418277128264658 -0.014089846549342982 0.013546939630177831 -0.12898210433715401 -0.0096131656521221531 -0.12864278247001287 0.14966609820033519 -0.071866730523262923 -0.29807917475351509 0.36322702078858382;-0.02738086304137376 -0.03550705177076429 0.085145098080832163 0.0030834230825459979 -0.070267702159733172 0.23660043189637739 0.21256436324491573 0.097751029474213061 0.28128777385901982 -0.17577955380246588 -0.11646327355925945 0.14971111234837867 0.3812756171097838 0.35555851626178786 0.0031993126373231449 0.21496514734600025 -0.066500104310615121 -0.045006544414110852 0.08095773394416346 -0.11309951547498787 0.12178028946649769 -0.069921424384963737 -0.17054328027672588 -0.33431503608606117 -0.21528178717784835 -0.092540214939175677 -0.051578970849587152 0.0028195703135608071 0.32679554996709209 0.025947967150840297 -0.011847255134022655 0.11485221703915026 -0.12840187424327193 -0.23335809323899667 -0.11044896749197876 0.11844834074642677 0.19467376832011329 -0.095596036863366179 -0.011214017721887709 -0.030295197207164472 0.17094908656210633 -0.0013098598058838256 -0.11165542377864651 0.04830300903702324 -0.082617931136651265 0.17346982990541379 -0.01362281445320083 -0.26981854634162294 -0.27418024814032138 0.31784299532905591 -0.12819513238563496 0.024260901487177734 -0.1367906976978531 -0.14431063641538577 -0.14010795716605648 0.14847353316266199 0.17062740675695443 -0.27634642868107934 -0.15028523215307318 -0.32298796230794535 -0.3018704712806955 0.080221301525203376 -0.067959643324881913 -0.0031953842284144079 0.21851179607966478 -0.10744596305060189 -0.19485281096919632 0.24873234201345501 0.048050873189218545 0.16492689113699233 0.14364370542669921 -0.081031977880438852 -0.17050045634225994 -0.02825924369222271 0.03566105355957562 -0.092805553434059995 0.021977649716106919 0.076739221430640672 0.089279492249502074 0.02406750066273625 0.08535433971667504 0.029403338940457834 -0.075691921573754373 -0.23730587537876885 -0.18559142775416754 -0.28937357281711618 -0.10606628189838339 -0.23334644466450546 -0.090567218816986178 -0.12821249223478989 -0.15790391144622803 -0.17246714669566193 0.30073179985939741 0.3458774835084002 -0.10108924937196474 -0.037456033852880495 -0.036283637973465663 -0.054232636307717734 -0.16618323833610149 -0.1503293457412796;0.060065210820049807 -0.14793267692529205 -0.13653866540615439 0.045405989144651167 -0.0047125688744343273 0.22708638188506364 0.23085268768615713 -0.15380365709128202 0.053069003123843689 -0.2002017491820807 -0.072734879633698374 0.008933606935602403 -0.16425920076730519 0.024343505547197698 0.17039458288622619 -0.076215090646324285 0.012324212613207819 -0.0067830426476172033 0.0032819425096986083 -0.049522310020729439 -0.18323637631828296 -0.23553609510269022 -0.1628234136331283 0.2541224658459072 0.23743352748974045 0.0056200676466664767 0.24407824171706202 0.22940725519775829 0.0060763691150258975 -0.042276733496074706 0.038855708902362444 0.0075472134587354564 -0.20075801614439545 -0.053621123403438789 -0.03853500847916938 0.042721844689846168 0.066403159393313038 0.21784717490155628 0.12688474814664283 -0.21078822921054388 0.039575310740584978 -0.12432125991612436 0.11628189748202261 0.025845592363055794 0.023638010878567692 0.16300440813167477 -0.14238027187430091 -0.18013772094254835 -0.10922586595722178 0.13339343371343571 0.047435767976681663 0.011004247095991324 0.13170841332258812 0.15303617253759641 -0.0082685942965385374 -0.15860796151330325 0.18276037251403951 -0.23788139876838507 0.092695427747180106 -0.016839557630246922 -0.053734785883205245 0.20137520603447065 0.20747371483040228 0.19296334978436519 -0.014305903851319428 -0.04336056861580987 0.050562499173454407 -0.21180750686522237 0.15193746653972862 -0.25282138436370238 0.17311745874849124 -0.24969902029527863 -0.077140922215128235 -0.16597650179652407 -0.025503639136491636 0.065507822776324526 -0.10885138164272209 0.15278711355442826 0.080888219278097057 0.17352751129056029 -0.076287447123317587 0.18975794136738997 -0.15333521303245637 0.1537313773404001 -0.090994177288416439 0.099194619876837864 -0.089992998389901185 -0.090161526091295602 -0.016922856780167524 -0.13448224527563651 -0.0088831112113293403 -0.20854104646913441 0.21682658112571504 -0.18016711036059285 -0.20646186953269829 0.12032824855817507 0.067296797932132793 -0.039980131269432818 0.12830955316729686 0.087831587897973726;-0.4326402629709733 -0.10023913308668578 -0.6168773910555998 -0.22654802690323517 -0.40515452941448282 0.26286182042256911 0.15687206826100106 -0.2031624183577756 -0.82903506853512787 0.7652963481591829 -0.75349978040895216 0.29126896387277323 -2.4330531561137017 -1.231743131526267 0.26095253592883161 0.35600841732571953 0.27375941162567519 0.15913929953987485 0.41877043653875834 0.39084240869410203 0.5663134013552078 1.4094261294734027 -0.40614765423755561 0.04450076729199276 0.88870093777636194 -0.081471272078852644 0.30692575817819728 -0.014061976392809386 0.25155544737392077 -0.035071504449994816 -0.28227398185446495 -0.37676547564652219 -0.02237061861995605 -0.089370445061855472 -0.56937025238520278 -0.75312069037661244 0.013323062465175546 -0.73730616193772047 0.01669346431843606 -0.83545171231246451 0.13938214796774312 -0.9196896252954091 0.92007766382957012 -0.37737701577211391 0.52106437223974922 -0.89746482618943768 -1.3216132363287316 -0.3675349927135253 -0.11089689182734384 -2.2940696745136027 0.46061503914657148 -0.30206287030512569 1.3682806217889225 0.52431394368355844 0.52215086235079311 0.60284925670738376 0.43248200870340919 -0.028021142043400237 -0.026150312133803408 0.45876727495174757 0.39595202648763245 0.28521476123949668 0.2708311429963241 1.4220654443531469 -0.6214829514828305 0.79177565859581089 0.4401477375652082 0.97117113075921224 0.67662388581745803 0.59832727814033648 -0.57819934671313811 -0.58075117206083837 -0.68095376427175391 -0.15327692161076881 -1.0578322849389337 0.39374004445013172 -0.84958081348837111 0.73720097847914334 -0.30406076872961718 0.55318639806066017 1.0887573004855993 1.3867076011069588 -0.075093159461777526 0.60834968526228617 1.3792638683731755 1.3295426408766675 0.92066390428472433 1.7497580307267357 2.1439647934514801 0.11222445925784209 0.62027700984693201 0.82788512382085433 0.43188375389801481 0.22946171868967741 0.79222613715534185 -0.22193735389724037 0.51654802364550345 -0.9847588803510654 -0.45544634282889923 0.18053066682774205;-0.16752475902809591 -0.17610238709823581 -0.05742339144851881 -0.1219302801601005 -0.034770212062732418 0.010258336968755052 -0.046417038697000555 0.1130281279826157 0.1154074415166927 -0.10047593574192146 -0.005694291540302647 -0.051562003936667461 -0.015945950655687314 -0.12208185828037937 0.051287715219530919 0.017531359893415917 0.052159188093094958 0.0060023707732209265 -0.25819782623828952 -0.083136474664663063 0.28036205187334146 0.14283650576095164 0.0594844367112966 -0.13351978372326984 -0.15343054605230433 -0.2690671840308545 -0.0601070778914672 -0.18500877783543657 0.072231528836395484 -0.1228442982861053 0.18402577806891557 0.20250481118636932 0.11147582184172307 0.0012408948684888652 -0.093291871158329265 0.0086047208062955856 -0.12731848519108199 -0.16810084741329803 -0.11505276303161305 0.099209910495405867 0.19055308949448271 0.0082149767614760599 0.27756437378277815 0.0099921712760029664 0.25503865162041633 0.11904688167261267 0.26952299919056566 0.088787518189877707 -0.14490178084841424 0.29883303313694881 -0.22973981082945086 0.033953894744481738 0.034430324198282569 0.062928832143934826 0.05779995108769042 0.21005642909814826 0.39981321084823468 0.039462222817048427 -0.11996014016915926 0.34337976714201618 0.07206780602653029 0.21606228213837911 0.20849169921767588 0.076762865561641747 0.20035546124838838 -0.21374942711667766 0.14662885870004874 0.073754057647541588 0.13784513465502274 0.12318152228307439 -0.035964731379931218 0.11987324882179559 0.17168766923451464 -0.18760721605904593 0.16617809877913994 0.073548571153696368 0.15353282891766323 -0.24842879411586305 0.040096795067477459 -0.30047076587351701 0.2490416350078562 0.32310185805781583 0.15973331816764727 0.099843927949608405 0.1268386740917222 0.22270841196428318 -0.040797610487322375 0.23739057909054054 -0.08301130095044347 -0.011454769846502155 0.18477052956314666 -0.17283772009843815 0.038588839195907658 -0.16403149204975773 -0.048565612432305436 -0.14736381183142308 0.23673540100918183 -0.010462799400162974 0.10336491744446576 0.1078207003759185;-0.11118785888263152 -0.016795055717991413 0.014270761931502889 -0.171207205036709 0.11084212439386457 0.12942155599128954 -0.31394740094849433 0.1157711594132575 -0.18272323954024655 -0.33237906885024593 0.17439248375323049 0.066384841682669365 -0.073877634146449267 -0.15201823907789327 -0.09672886242631272 -0.24061463735479732 -0.0033945608801390663 -0.074438678785906112 -0.20853283847139664 0.08476352077549601 -0.14566250795407393 0.13566707310721396 0.15253043116519918 0.1626235267418614 0.099835870880471467 -0.037445452909379805 0.0061959296975337306 -0.046120692094774915 0.10288992779096744 0.072496134138130858 -0.026850668698408152 -0.046287870170103045 0.087888411018702928 0.073645599101539672 0.027491311803362374 -0.11132163299175014 0.24737014498413248 -0.046792619514881867 0.079336739693006697 -0.16650968102274399 -0.29374052684579938 -0.0038365689521742616 -0.20912437365747641 -0.24708732993080026 0.12579713159605674 -0.03182691334802857 0.0020491880717909746 -0.057405073150654191 -0.051176387322954126 0.11724216204431009 -0.060611312887039748 0.10828295579049504 0.12587297678782194 0.012364688808395904 0.15657138965958173 0.072523489051700571 -0.36474404821830575 0.020661843981273974 0.16968066525842238 0.1172022069152754 0.19309485691472067 0.058441545588225605 -0.020971421471196364 0.25069458574347642 -0.094405437010407239 -0.097126399307357641 -0.068557073854980735 0.076126972025704162 -0.076582266448372585 -0.13941895996558032 0.12425772631270596 -0.17792107546195979 0.17161773899251584 0.028108230240480619 0.034318136115869036 0.01668234933634806 0.0032110155437198411 0.088887882874166671 0.039244941790385811 -0.011720554054332807 -0.14778377559051373 -0.20072528560598857 0.36072513814897161 0.19168881111678343 -0.13088208002337842 0.031190821737479637 -0.16012406145846494 -0.027724155896565503 0.11026254296294793 0.063403767279128359 0.15403652651260161 0.082142965921760014 -0.12245447130219549 -0.084925986799276876 0.15948005369566087 -0.043226145284539143 0.20605559033949805 -0.012241712227011623 0.21940397193117542 0.20232204700854284;-0.052203684229757706 0.10427970710866587 -0.12520781432330816 -0.081641273032107414 -0.0061578199284414419 0.22535842860311592 0.060964079401984929 0.024162941592176558 0.013028687983765559 -0.1190788425029662 0.14724194045770614 -0.16136224164406429 -0.23965697839321651 -0.12404389213508202 0.11417368202293054 0.19652854263718839 0.067485788178637235 0.12376174628277134 -0.0032053999446093988 -0.10336268764506384 -0.19318103321215954 0.0074386389006150591 -0.09654948220399015 0.17319779576323621 -0.044508969736163265 0.19463886567005673 0.064104818964883278 0.16011042046973481 -0.074873419012908407 -0.028372854162654289 0.045004782328352068 0.062446484380634444 -0.26539527359142812 0.13380483639750129 0.16290032446871305 -0.22384119571829439 0.032146891934673717 -0.067779192287654347 0.31511462156137499 -0.053683921156459188 0.044004080108940406 0.086416622779232358 0.046884607040730178 0.1560151248468348 0.16648987449338598 0.0083556770765996248 -0.085766499774183408 -0.028605761435143956 -0.0565548250791265 0.050483403952512981 0.37281745527959098 -0.069777627599480072 -0.030956284529908364 -0.032663483611000174 0.1213350627227249 -0.0051159806634874863 0.22134158218816238 -0.05502028119854388 0.16326610556013132 0.064190567822219685 0.0008987018473521108 0.072018917692131645 0.12053144907565788 0.13983850998217034 -0.22699479120133476 0.2034861189402547 -0.11927405806230097 0.17990608052089779 0.11959159169031022 -0.15402086511327759 0.12044246006443096 -0.16566422659879418 -0.2139839482159078 -0.1024242021761024 -0.069681607889957795 -0.23995720406552609 -0.072297715120962933 0.020628891217475746 -0.06339549865604853 -0.12930610722369595 -0.24461135647197943 0.19031813424565225 -0.084299281106508653 -0.31747960973103084 0.013299665935995924 0.014898072534798188 -0.081621710437095915 0.034879780068738153 0.097474740672828922 0.15027104171899602 -0.087959592872438069 0.073646751507792887 0.12057972881880764 -0.086702828313997615 -0.1478002982676262 -0.19573296452990616 0.1219433116729729 -0.0079754012442862267 -0.18419677609374671 0.12801257767750335;0.036206247808805395 -0.27061993888655894 -0.086531832072172771 -0.066422058798955588 -0.17085517036887676 0.017458072233340012 0.035276141491032587 -0.14840753284300448 0.21164029708867241 -0.16959600238936862 0.012809147450402 0.1534167887555079 0.031504322777150838 -0.00048608036789659671 0.092514118361718953 -0.15827597383824554 -0.057316057378321308 0.067456775715764583 -0.061766375265683696 -0.10616672280655673 0.050582916208757531 0.14529832612490165 -0.091138519795536888 0.054718863557984186 -0.03143617058719516 0.12926013046788626 0.17670499703637416 0.14358446422221011 -0.13335289793237992 0.19847820989774001 0.19264599798237361 0.18419527381719697 -0.042211116978521139 0.02368852982612997 -0.18756139906621441 0.1475963650976089 0.062463583051263066 0.041539893617717857 -0.11264390003166748 0.15045264075783721 -0.1790986308499678 -0.13057758067651051 -0.26908322015093 -0.033071130238573887 0.014986014135536286 -0.043002952920829111 0.049981520180438194 0.040401260146232625 -0.013143093384507186 0.065666849487789017 -0.17402937516512024 -0.16149350797512915 0.012587354375489378 0.23182385869170224 0.03852440084845838 -0.074163696466401946 -0.015833979691954693 0.039726610387883131 -0.13849014939344165 0.2155634399460267 0.22550575182525448 0.065884117121376373 0.024241790077569665 0.17585128781574766 -0.033420432982188546 0.17900258387358742 0.13813004617049088 0.057211840755740762 0.16225165788940094 -0.25176099767113702 0.1699389163906439 -0.14333232616114908 -0.18725187108100558 0.089488496657012973 0.08874167858287188 0.20316775419815428 -0.087236120062365641 0.045134264486901304 0.18620433461059951 0.011798784656446961 -0.045602578166142362 -0.31169119028669007 -0.1569097375727552 -0.22146016834257964 0.011653278113581878 -0.10539065969741365 -0.0041060843568766561 -0.15367287625255346 -0.12155777219946112 -0.27811617991779602 -0.25965813893949552 0.015208729376411212 0.094021134816059976 0.0034755427765042471 -0.068428944310210141 -0.092968663435633106 -0.11883975521644058 0.076002578558195671 -0.22116892707250924 0.21238159911022686];
  IW1_2 = [0.78849826546382917 0.16706695767290272 0.1446278259618895 -0.50382958769255715;-0.12953221204339985 -0.062586200794583616 -0.044813108964952983 -0.14355199898977603;-0.17914956290826178 0.28513195987445111 0.11011783453978863 0.34296724414114765;-0.049437829204647545 -0.051434263782200666 -0.12576021514431693 -0.27239537855970303;0.11282139256511688 0.33818872405258277 -0.090729031565346355 0.006290224732272566;2.1265905031744428 1.6805924134719323 1.5590755947811987 1.3182592655462004;0.38086685655194585 0.17573943457221947 -0.097891456269731877 -0.15884106959594463;0.39689473465567648 0.39626487362001339 0.20811470938358737 -0.17822580054099155;1.298016853723958 0.29467957730839212 0.22963488968008591 0.2343764930680014;-0.30569653053343965 0.084370187444773218 -0.17819700291318513 0.28264012951052692];
  
  % Layer 2
  b2 = -1.155892241714648;
  LW2_1 = [-1.1322290446926431 0.023213677941431542 0.02664956137953807 -0.091610889073379859 -0.012276807634940278 2.3948857205426872 0.014193573022006427 -0.088798873260705111 -1.4193293016874513 0.09012743530777137];
  
  % Output 1
  y1_step1_ymin = -1;
  y1_step1_gain = 2;
  y1_step1_xoffset = 0;
  
  % ===== SIMULATION ========
  
  % Format Input Arguments
  isCellX = iscell(X);
  if ~isCellX, X = {X}; end;
  if (nargin < 2), error('Initial input states Xi argument needed.'); end
  
  % Dimensions
  TS = size(X,2); % timesteps
  if ~isempty(X)
    Q = size(X{1},2); % samples/series
  elseif ~isempty(Xi)
    Q = size(Xi{1},2);
  else
    Q = 0;
  end
  
  % Input 1 Delay States
  Xd1 = cell(1,5);
  for ts=1:4
    Xd1{ts} = mapminmax_apply(Xi{1,ts},x1_step1_gain,x1_step1_xoffset,x1_step1_ymin);
  end
  
  % Input 2 Delay States
  Xd2 = cell(1,5);
  for ts=1:4
    Xd2{ts} = mapminmax_apply(Xi{2,ts},x2_step1_gain,x2_step1_xoffset,x2_step1_ymin);
  end
  
  % Allocate Outputs
  Y = cell(1,TS);
  
  % Time loop
  for ts=1:TS
  
    % Rotating delay state position
    xdts = mod(ts+3,5)+1;
  
    % Input 1
    Xd1{xdts} = mapminmax_apply(X{1,ts},x1_step1_gain,x1_step1_xoffset,x1_step1_ymin);
    
    % Input 2
    Xd2{xdts} = mapminmax_apply(X{2,ts},x2_step1_gain,x2_step1_xoffset,x2_step1_ymin);
    
    % Layer 1
    tapdelay1 = cat(1,Xd1{mod(xdts-[1 2 3 4]-1,5)+1});
    tapdelay2 = cat(1,Xd2{mod(xdts-[1 2 3 4]-1,5)+1});
    a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*tapdelay1 + IW1_2*tapdelay2);
    
    % Layer 2
    a2 = repmat(b2,1,Q) + LW2_1*a1;
    
    % Output 1
    Y{1,ts} = mapminmax_reverse(a2,y1_step1_gain,y1_step1_xoffset,y1_step1_ymin);
  end
  
  % Final Delay States
  finalxts = TS+(1: 4);
  xits = finalxts(finalxts<=4);
  xts = finalxts(finalxts>4)-4;
  Xf = [Xi(:,xits) X(:,xts)];
  Af = cell(2,0);
  
  % Format Output Arguments
  if ~isCellX, Y = cell2mat(Y); end
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings_gain,settings_xoffset,settings_ymin)
  y = bsxfun(@minus,x,settings_xoffset);
  y = bsxfun(@times,y,settings_gain);
  y = bsxfun(@plus,y,settings_ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n)
  a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings_gain,settings_xoffset,settings_ymin)
  x = bsxfun(@minus,y,settings_ymin);
  x = bsxfun(@rdivide,x,settings_gain);
  x = bsxfun(@plus,x,settings_xoffset);
end