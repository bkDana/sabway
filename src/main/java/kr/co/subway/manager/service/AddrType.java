package kr.co.subway.manager.service;

import org.springframework.stereotype.Component;

@Component("addrtype")
public class AddrType {
	public String addrType(String applyArea) {
		String addrFirstNo = "";
		String addrSecondNo = "";
		//넘어오는 지역에 따라 지역번호 변경
		if(applyArea.contains("서울특별시")|applyArea.contains("서울")) {
			addrFirstNo = "A";
			if(applyArea.contains("강남구")) {
				addrSecondNo = "aa";
			}
			else if(applyArea.contains("강동구")) {
				addrSecondNo = "ab";
			}
			else if(applyArea.contains("강북구")) {
				addrSecondNo = "ac";
			}
			else if(applyArea.contains("강서구")) {
				addrSecondNo = "ad";
			}
			else if(applyArea.contains("관악구")) {
				addrSecondNo = "ae";
			}
			else if(applyArea.contains("광진구")) {
				addrSecondNo = "af";
			}
			else if(applyArea.contains("구로구")) {
				addrSecondNo = "ag";
			}
			else if(applyArea.contains("금천구")) {
				addrSecondNo = "ah";
			}
			else if(applyArea.contains("노원구")) {
				addrSecondNo = "ai";
			}
			else if(applyArea.contains("도봉구")) {
				addrSecondNo = "aj";
			}
			else if(applyArea.contains("동대문구")) {
				addrSecondNo = "ak";
			}
			else if(applyArea.contains("동작구")) {
				addrSecondNo = "al";
			}
			else if(applyArea.contains("마포구")) {
				addrSecondNo = "am";
			}
			else if(applyArea.contains("서대문구")) {
				addrSecondNo = "an";
			}
			else if(applyArea.contains("서초구")) {
				addrSecondNo = "ao";
			}
			else if(applyArea.contains("성동구")) {
				addrSecondNo = "ap";
			}
			else if(applyArea.contains("성북구")) {
				addrSecondNo = "aq";
			}
			else if(applyArea.contains("송파구")) {
				addrSecondNo = "ar";
			}
			else if(applyArea.contains("양천구")) {
				addrSecondNo = "as";
			}
			else if(applyArea.contains("영등포구")) {
				addrSecondNo = "at";
			}
			else if(applyArea.contains("용산구")) {
				addrSecondNo = "au";
			}
			else if(applyArea.contains("은평구")) {
				addrSecondNo = "av";
			}
			else if(applyArea.contains("종로구")) {
				addrSecondNo = "aw";
			}
			else if(applyArea.contains("중구")) {
				addrSecondNo = "ax";
			}
			else if(applyArea.contains("중랑구")) {
				addrSecondNo = "ay";
			}
		}else if(applyArea.contains("인천광역시")|applyArea.contains("인천")|applyArea.contains("부천")) {
			addrFirstNo = "B";
			if(applyArea.contains("강화군")) {
				addrSecondNo = "ba";
			}
			else if(applyArea.contains("계양구")) {
				addrSecondNo = "bb";
			}
			else if(applyArea.contains("남구")) {
				addrSecondNo = "bc";
			}
			else if(applyArea.contains("남동구")) {
				addrSecondNo = "bd";
			}
			else if(applyArea.contains("동구")) {
				addrSecondNo = "be";
			}
			else if(applyArea.contains("부평구")) {
				addrSecondNo = "bf";
			}
			else if(applyArea.contains("서구")) {
				addrSecondNo = "bg";
			}
			else if(applyArea.contains("연수구")) {
				addrSecondNo = "bh";
			}
			else if(applyArea.contains("옹진군")) {
				addrSecondNo = "bi";
			}
			else if(applyArea.contains("중구")) {
				addrSecondNo = "bj";
			}
		}else if(applyArea.contains("경기도")) {
			addrFirstNo = "C";
			if(applyArea.contains("가평군")) {
				addrSecondNo = "ca";
			}
			else if(applyArea.contains("고양시 덕양구")) {
				addrSecondNo = "cb";
			}
			else if(applyArea.contains("고양시 일산동구")) {
				addrSecondNo = "cc";
			}
			else if(applyArea.contains("고양시 일산서구")) {
				addrSecondNo = "cd";
			}
			else if(applyArea.contains("과천시")) {
				addrSecondNo = "ce";
			}
			else if(applyArea.contains("광명시")) {
				addrSecondNo = "cf";
			}
			else if(applyArea.contains("광주시")) {
				addrSecondNo = "cg";
			}
			else if(applyArea.contains("구리시")) {
				addrSecondNo = "ch";
			}
			else if(applyArea.contains("군포시")) {
				addrSecondNo = "ci";
			}
			else if(applyArea.contains("김포시")) {
				addrSecondNo = "cj";
			}
			else if(applyArea.contains("남양주시")) {
				addrSecondNo = "ck";
			}
			else if(applyArea.contains("동두천시")) {
				addrSecondNo = "cl";
			}
			else if(applyArea.contains("부천시")) {
				addrSecondNo = "cm";
			}
			else if(applyArea.contains("성남시 분당구")) {
				addrSecondNo = "cn";
			}
			else if(applyArea.contains("성남시 수정구")) {
				addrSecondNo = "co";
			}
			else if(applyArea.contains("성남시 중원구")) {
				addrSecondNo = "cp";
			}
			else if(applyArea.contains("수원시 권선구")) {
				addrSecondNo = "cq";
			}
			else if(applyArea.contains("수원시 영통구")) {
				addrSecondNo = "cr";
			}
			else if(applyArea.contains("수원시 장안구")) {
				addrSecondNo = "cs";
			}
			else if(applyArea.contains("수원시 팔달구")) {
				addrSecondNo = "ct";
			}
			else if(applyArea.contains("시흥시")) {
				addrSecondNo = "cu";
			}
			else if(applyArea.contains("안산시 단원구")) {
				addrSecondNo = "cv";
			}
			else if(applyArea.contains("안산시 상록구")) {
				addrSecondNo = "cw";
			}
			else if(applyArea.contains("안성시")) {
				addrSecondNo = "cx";
			}
			else if(applyArea.contains("안양시 동안구")) {
				addrSecondNo = "cy";
			}
			else if(applyArea.contains("안양시 만안구")) {
				addrSecondNo = "cz";
			}
			else if(applyArea.contains("양주시")) {
				addrSecondNo = "caa";
			}
			else if(applyArea.contains("양평군")) {
				addrSecondNo = "cab";
			}
			else if(applyArea.contains("여주시")) {
				addrSecondNo = "cac";
			}
			else if(applyArea.contains("연천군")) {
				addrSecondNo = "cad";
			}
			else if(applyArea.contains("오산시")) {
				addrSecondNo = "cae";
			}
			else if(applyArea.contains("용인시 기흥구")) {
				addrSecondNo = "caf";
			}
			else if(applyArea.contains("용인시 수지구")) {
				addrSecondNo = "cag";
			}
			else if(applyArea.contains("용인시 처인구")) {
				addrSecondNo = "cah";
			}
			else if(applyArea.contains("의왕시")) {
				addrSecondNo = "cai";
			}
			else if(applyArea.contains("의정부시")) {
				addrSecondNo = "caj";
			}
			else if(applyArea.contains("이천시")) {
				addrSecondNo = "cak";
			}
			else if(applyArea.contains("파주시")) {
				addrSecondNo = "cal";
			}
			else if(applyArea.contains("평택시")) {
				addrSecondNo = "cam";
			}
			else if(applyArea.contains("포천시")) {
				addrSecondNo = "can";
			}
			else if(applyArea.contains("하남시")) {
				addrSecondNo = "cao";
			}
			else if(applyArea.contains("화성시")) {
				addrSecondNo = "cap";
			}
		}else if(applyArea.contains("강원도")|applyArea.contains("강원")) {
			addrFirstNo = "D";
			if(applyArea.contains("강릉시")) {
				addrSecondNo = "da";
			}
			else if(applyArea.contains("고성군")) {
				addrSecondNo = "db";
			}
			else if(applyArea.contains("동해시")) {
				addrSecondNo = "dc";
			}
			else if(applyArea.contains("삼척시")) {
				addrSecondNo = "dd";
			}
			else if(applyArea.contains("속초시")) {
				addrSecondNo = "de";
			}
			else if(applyArea.contains("양구군")) {
				addrSecondNo = "df";
			}
			else if(applyArea.contains("양양군")) {
				addrSecondNo = "dg";
			}
			else if(applyArea.contains("영월군")) {
				addrSecondNo = "dh";
			}
			else if(applyArea.contains("원주시")) {
				addrSecondNo = "di";
			}
			else if(applyArea.contains("인제군")) {
				addrSecondNo = "dj";
			}
			else if(applyArea.contains("정선군")) {
				addrSecondNo = "dk";
			}
			else if(applyArea.contains("철원군")) {
				addrSecondNo = "dl";
			}
			else if(applyArea.contains("춘천시")) {
				addrSecondNo = "dm";
			}
			else if(applyArea.contains("태백시")) {
				addrSecondNo = "dn";
			}
			else if(applyArea.contains("평창군")) {
				addrSecondNo = "do";
			}
			else if(applyArea.contains("홍천군")) {
				addrSecondNo = "dp";
			}
			else if(applyArea.contains("화천군")) {
				addrSecondNo = "dq";
			}
			else if(applyArea.contains("횡성군")) {
				addrSecondNo = "dr";
			}
		}else if(applyArea.contains("충청남도")|applyArea.contains("충남")) {
			addrFirstNo = "E";
			if(applyArea.contains("계룡시")) {
				addrSecondNo = "ea";
			}
			else if(applyArea.contains("공주시")) {
				addrSecondNo = "eb";
			}
			else if(applyArea.contains("금산군")) {
				addrSecondNo = "ec";
			}
			else if(applyArea.contains("논산시")) {
				addrSecondNo = "ed";
			}
			else if(applyArea.contains("당진시")) {
				addrSecondNo = "ee";
			}
			else if(applyArea.contains("보령시")) {
				addrSecondNo = "ef";
			}
			else if(applyArea.contains("부여군")) {
				addrSecondNo = "eg";
			}
			else if(applyArea.contains("서산시")) {
				addrSecondNo = "eh";
			}
			else if(applyArea.contains("서천군")) {
				addrSecondNo = "ei";
			}
			else if(applyArea.contains("아산시")) {
				addrSecondNo = "ej";
			}
			else if(applyArea.contains("예산군")) {
				addrSecondNo = "ek";
			}
			else if(applyArea.contains("천안시 동남구")) {
				addrSecondNo = "el";
			}
			else if(applyArea.contains("천안시 서북구")) {
				addrSecondNo = "em";
			}
			else if(applyArea.contains("청양군")) {
				addrSecondNo = "en";
			}
			else if(applyArea.contains("태안군")) {
				addrSecondNo = "eo";
			}
			else if(applyArea.contains("홍성군")) {
				addrSecondNo = "ep";
			}
		}else if(applyArea.contains("대전광역시")|applyArea.contains("대전")) {
			addrFirstNo = "F";
			if(applyArea.contains("대덕구")) {
				addrSecondNo = "fa";
			}
			else if(applyArea.contains("동구")) {
				addrSecondNo = "fb";
			}
			else if(applyArea.contains("서구")) {
				addrSecondNo = "fc";
			}
			else if(applyArea.contains("유성구")) {
				addrSecondNo = "fd";
			}
			else if(applyArea.contains("중구")) {
				addrSecondNo = "fe";
			}
		}else if(applyArea.contains("충청북도")|applyArea.contains("충북")) {
			addrFirstNo = "G";
			if(applyArea.contains("괴산군")) {
				addrSecondNo = "ga";
			}
			else if(applyArea.contains("단양군")) {
				addrSecondNo = "gb";
			}
			else if(applyArea.contains("보은군")) {
				addrSecondNo = "gc";
			}
			else if(applyArea.contains("영동군")) {
				addrSecondNo = "gd";
			}
			else if(applyArea.contains("옥천군")) {
				addrSecondNo = "ge";
			}
			else if(applyArea.contains("음성군")) {
				addrSecondNo = "gf";
			}
			else if(applyArea.contains("제천시")) {
				addrSecondNo = "gg";
			}
			else if(applyArea.contains("증평군")) {
				addrSecondNo = "gh";
			}
			else if(applyArea.contains("진천군")) {
				addrSecondNo = "gi";
			}
			else if(applyArea.contains("청주시 상당구")) {
				addrSecondNo = "gj";
			}
			else if(applyArea.contains("청주시 서원구")) {
				addrSecondNo = "gk";
			}
			else if(applyArea.contains("청주시 청원구")) {
				addrSecondNo = "gl";
			}
			else if(applyArea.contains("청주시 흥덕구")) {
				addrSecondNo = "gm";
			}
			else if(applyArea.contains("충주시")) {
				addrSecondNo = "gn";
			}
		}else if(applyArea.contains("세종특별자치시")|applyArea.contains("세종")) {
			addrFirstNo = "H";
		}else if(applyArea.contains("부산광역시")|applyArea.contains("부산")) {
			addrFirstNo = "I";
			if(applyArea.contains("강서구")) {
				addrSecondNo = "ia";
			}
			else if(applyArea.contains("금정구")) {
				addrSecondNo = "ib";
			}
			else if(applyArea.contains("기장군")) {
				addrSecondNo = "ic";
			}
			else if(applyArea.contains("남구")) {
				addrSecondNo = "id";
			}
			else if(applyArea.contains("동구")) {
				addrSecondNo = "ie";
			}
			else if(applyArea.contains("동래구")) {
				addrSecondNo = "if";
			}
			else if(applyArea.contains("부산진구")) {
				addrSecondNo = "ig";
			}
			else if(applyArea.contains("북구")) {
				addrSecondNo = "ih";
			}
			else if(applyArea.contains("사상구")) {
				addrSecondNo = "ii";
			}
			else if(applyArea.contains("사하구")) {
				addrSecondNo = "ij";
			}
			else if(applyArea.contains("서구")) {
				addrSecondNo = "ik";
			}
			else if(applyArea.contains("수영구")) {
				addrSecondNo = "il";
			}
			else if(applyArea.contains("연제구")) {
				addrSecondNo = "im";
			}
			else if(applyArea.contains("영도구")) {
				addrSecondNo = "in";
			}
			else if(applyArea.contains("중구")) {
				addrSecondNo = "io";
			}
			else if(applyArea.contains("해운대구")) {
				addrSecondNo = "ip";
			}
		}else if(applyArea.contains("울산광역시")|applyArea.contains("울산")) {
			addrFirstNo = "J";
			if(applyArea.contains("남구")) {
				addrSecondNo = "ja";
			}
			else if(applyArea.contains("동구")) {
				addrSecondNo = "jb";
			}
			else if(applyArea.contains("북구")) {
				addrSecondNo = "jc";
			}
			else if(applyArea.contains("울주군")) {
				addrSecondNo = "jd";
			}
			else if(applyArea.contains("중구")) {
				addrSecondNo = "je";
			}
		}else if(applyArea.contains("대구광역시")|applyArea.contains("대구")) {
			addrFirstNo = "K";
			if(applyArea.contains("남구")) {
				addrSecondNo = "ka";
			}
			else if(applyArea.contains("달서구")) {
				addrSecondNo = "kb";
			}
			else if(applyArea.contains("달성군")) {
				addrSecondNo = "kc";
			}
			else if(applyArea.contains("동구")) {
				addrSecondNo = "kd";
			}
			else if(applyArea.contains("북구")) {
				addrSecondNo = "ke";
			}
			else if(applyArea.contains("서구")) {
				addrSecondNo = "kf";
			}
			else if(applyArea.contains("수성구")) {
				addrSecondNo = "kg";
			}
			else if(applyArea.contains("중구")) {
				addrSecondNo = "kh";
			}
		}else if(applyArea.contains("경상북도")|applyArea.contains("경북")) {
			addrFirstNo = "L";
			if(applyArea.contains("경산시")) {
				addrSecondNo = "la";
			}
			else if(applyArea.contains("경주시")) {
				addrSecondNo = "lb";
			}
			else if(applyArea.contains("고령군")) {
				addrSecondNo = "lc";
			}
			else if(applyArea.contains("구미시")) {
				addrSecondNo = "ld";
			}
			else if(applyArea.contains("군위군")) {
				addrSecondNo = "le";
			}
			else if(applyArea.contains("김천시")) {
				addrSecondNo = "lf";
			}
			else if(applyArea.contains("문경시")) {
				addrSecondNo = "lg";
			}
			else if(applyArea.contains("봉화군")) {
				addrSecondNo = "lh";
			}
			else if(applyArea.contains("상주시")) {
				addrSecondNo = "li";
			}
			else if(applyArea.contains("성주군")) {
				addrSecondNo = "lg";
			}
			else if(applyArea.contains("안동시")) {
				addrSecondNo = "lk";
			}
			else if(applyArea.contains("영덕군")) {
				addrSecondNo = "ll";
			}
			else if(applyArea.contains("영양군")) {
				addrSecondNo = "lm";
			}
			else if(applyArea.contains("영주시")) {
				addrSecondNo = "ln";
			}
			else if(applyArea.contains("영천시")) {
				addrSecondNo = "lo";
			}
			else if(applyArea.contains("예천군")) {
				addrSecondNo = "lp";
			}
			else if(applyArea.contains("울릉군")) {
				addrSecondNo = "lq";
			}
			else if(applyArea.contains("울진군")) {
				addrSecondNo = "lr";
			}
			else if(applyArea.contains("의성군")) {
				addrSecondNo = "ls";
			}
			else if(applyArea.contains("청도군")) {
				addrSecondNo = "lt";
			}
			else if(applyArea.contains("청송군")) {
				addrSecondNo = "lu";
			}
			else if(applyArea.contains("칠곡군")) {
				addrSecondNo = "lv";
			}
			else if(applyArea.contains("포항시 남구")) {
				addrSecondNo = "lw";
			}
			else if(applyArea.contains("포항시 북구")) {
				addrSecondNo = "lx";
			}
		}else if(applyArea.contains("경상남도")|applyArea.contains("경남")) {
			addrFirstNo = "M";
			if(applyArea.contains("거제시")) {
				addrSecondNo = "ma";
			}
			else if(applyArea.contains("거창군")) {
				addrSecondNo = "mb";
			}
			else if(applyArea.contains("고성군")) {
				addrSecondNo = "mc";
			}
			else if(applyArea.contains("김해시")) {
				addrSecondNo = "md";
			}
			else if(applyArea.contains("남해군")) {
				addrSecondNo = "me";
			}
			else if(applyArea.contains("밀양시")) {
				addrSecondNo = "mf";
			}
			else if(applyArea.contains("사천시")) {
				addrSecondNo = "mg";
			}
			else if(applyArea.contains("산청군")) {
				addrSecondNo = "mh";
			}
			else if(applyArea.contains("양산시")) {
				addrSecondNo = "mi";
			}
			else if(applyArea.contains("의령군")) {
				addrSecondNo = "mj";
			}
			else if(applyArea.contains("진주시")) {
				addrSecondNo = "mk";
			}
			else if(applyArea.contains("창녕군")) {
				addrSecondNo = "ml";
			}
			else if(applyArea.contains("창원시 마산합포구")) {
				addrSecondNo = "mm";
			}
			else if(applyArea.contains("창원시 마산회원구")) {
				addrSecondNo = "mn";
			}
			else if(applyArea.contains("창원시 성산구")) {
				addrSecondNo = "mo";
			}
			else if(applyArea.contains("창원시 의창구")) {
				addrSecondNo = "mp";
			}
			else if(applyArea.contains("창원시 진해구")) {
				addrSecondNo = "mq";
			}
			else if(applyArea.contains("통영시")) {
				addrSecondNo = "mr";
			}
			else if(applyArea.contains("하동군")) {
				addrSecondNo = "ms";
			}
			else if(applyArea.contains("함안군")) {
				addrSecondNo = "mt";
			}
			else if(applyArea.contains("함양군")) {
				addrSecondNo = "mu";
			}
			else if(applyArea.contains("합천군")) {
				addrSecondNo = "mv";
			}
		}else if(applyArea.contains("전라남도")|applyArea.contains("전남")) {
			addrFirstNo = "N";
			if(applyArea.contains("강진군")) {
				addrSecondNo = "na";
			}
			else if(applyArea.contains("고흥군")) {
				addrSecondNo = "nb";
			}
			else if(applyArea.contains("곡성군")) {
				addrSecondNo = "nc";
			}
			else if(applyArea.contains("광양시")) {
				addrSecondNo = "nd";
			}
			else if(applyArea.contains("구례군")) {
				addrSecondNo = "ne";
			}
			else if(applyArea.contains("나주시")) {
				addrSecondNo = "nf";
			}
			else if(applyArea.contains("담양군")) {
				addrSecondNo = "ng";
			}
			else if(applyArea.contains("목포시")) {
				addrSecondNo = "nh";
			}
			else if(applyArea.contains("무안군")) {
				addrSecondNo = "ni";
			}
			else if(applyArea.contains("보성군")) {
				addrSecondNo = "nj";
			}
			else if(applyArea.contains("순천시")) {
				addrSecondNo = "nk";
			}
			else if(applyArea.contains("신안군")) {
				addrSecondNo = "nl";
			}
			else if(applyArea.contains("여수시")) {
				addrSecondNo = "nm";
			}
			else if(applyArea.contains("영광군")) {
				addrSecondNo = "nn";
			}
			else if(applyArea.contains("영암군")) {
				addrSecondNo = "no";
			}
			else if(applyArea.contains("완도군")) {
				addrSecondNo = "np";
			}
			else if(applyArea.contains("장성군")) {
				addrSecondNo = "nq";
			}
			else if(applyArea.contains("장흥군")) {
				addrSecondNo = "nr";
			}
			else if(applyArea.contains("진도군")) {
				addrSecondNo = "ns";
			}
			else if(applyArea.contains("함평군")) {
				addrSecondNo = "nt";
			}
			else if(applyArea.contains("해남군")) {
				addrSecondNo = "nu";
			}
			else if(applyArea.contains("화순군")) {
				addrSecondNo = "nv";
			}
		}else if(applyArea.contains("광주광역시")|applyArea.contains("광주")) {
			addrFirstNo = "O";
			if(applyArea.contains("광산구")) {}
			else if(applyArea.contains("남구")) {
				addrSecondNo = "oa";
			}
			else if(applyArea.contains("동구")) {
				addrSecondNo = "ob";
			}
			else if(applyArea.contains("북구")) {
				addrSecondNo = "oc";
			}
			else if(applyArea.contains("서구")) {
				addrSecondNo = "od";
			}
		}else if(applyArea.contains("전라북도")|applyArea.contains("전북")) {
			addrFirstNo = "P";
			if(applyArea.contains("고창군")) {
				addrSecondNo = "pa";
			}
			else if(applyArea.contains("군산시")) {
				addrSecondNo = "pb";
			}
			else if(applyArea.contains("김제시")) {
				addrSecondNo = "pc";
			}
			else if(applyArea.contains("남원시")) {
				addrSecondNo = "pd";
			}
			else if(applyArea.contains("무주군")) {
				addrSecondNo = "pe";
			}
			else if(applyArea.contains("부안군")) {
				addrSecondNo = "pf";
			}
			else if(applyArea.contains("순창군")) {
				addrSecondNo = "pg";
			}
			else if(applyArea.contains("완주군")) {
				addrSecondNo = "ph";
			}
			else if(applyArea.contains("익산시")) {
				addrSecondNo = "pi";
			}
			else if(applyArea.contains("임실군")) {
				addrSecondNo = "pj";
			}
			else if(applyArea.contains("장수군")) {
				addrSecondNo = "pk";
			}
			else if(applyArea.contains("전주시 덕진구")) {
				addrSecondNo = "pl";
			}
			else if(applyArea.contains("전주시 완산구")) {
				addrSecondNo = "pm";
			}
			else if(applyArea.contains("정읍시")) {
				addrSecondNo = "pn";
			}
			else if(applyArea.contains("진안군")) {
				addrSecondNo = "po";
			}
		}else if(applyArea.contains("제주특별자치도")|applyArea.contains("제주도")) {
			addrFirstNo = "Q";
			if(applyArea.contains("서귀포시")) {
				addrSecondNo = "qa";
			}		
			else if(applyArea.contains("제주시")) {
				addrSecondNo = "qb";
			}
		}
		String addrType = addrFirstNo+addrSecondNo;
		return addrType;
	}
}
