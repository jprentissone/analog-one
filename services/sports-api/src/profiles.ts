export type CollegeProfile = {
  id: string;
  cfbdTeamId: number;
  displayName: string;
  abbreviation: string;
  primaryColor: string;
  secondaryColor: string;
};

const COLLEGE_PROFILES: Record<string, CollegeProfile> = {
  alabama: { id: "alabama", cfbdTeamId: 333, displayName: "Alabama", abbreviation: "BAMA", primaryColor: "#9E1B32", secondaryColor: "#FFFFFF" },
  arkansas: { id: "arkansas", cfbdTeamId: 8, displayName: "Arkansas", abbreviation: "ARK", primaryColor: "#9D2235", secondaryColor: "#FFFFFF" },
  auburn: { id: "auburn", cfbdTeamId: 2, displayName: "Auburn", abbreviation: "AUB", primaryColor: "#0C2340", secondaryColor: "#F26522" },
  florida: { id: "florida", cfbdTeamId: 57, displayName: "Florida", abbreviation: "FLA", primaryColor: "#0021A5", secondaryColor: "#FA4616" },
  georgia: { id: "georgia", cfbdTeamId: 61, displayName: "Georgia", abbreviation: "UGA", primaryColor: "#BA0C2F", secondaryColor: "#FFFFFF" },
  kentucky: { id: "kentucky", cfbdTeamId: 96, displayName: "Kentucky", abbreviation: "UK", primaryColor: "#0033A0", secondaryColor: "#FFFFFF" },
  lsu: { id: "lsu", cfbdTeamId: 99, displayName: "LSU", abbreviation: "LSU", primaryColor: "#461D7C", secondaryColor: "#FDD023" },
  mississippi_state: { id: "mississippi_state", cfbdTeamId: 344, displayName: "Mississippi State", abbreviation: "MSST", primaryColor: "#5D1725", secondaryColor: "#FFFFFF" },
  missouri: { id: "missouri", cfbdTeamId: 142, displayName: "Missouri", abbreviation: "MIZ", primaryColor: "#000000", secondaryColor: "#F1B82D" },
  oklahoma: { id: "oklahoma", cfbdTeamId: 201, displayName: "Oklahoma", abbreviation: "OU", primaryColor: "#841617", secondaryColor: "#FDF9D8" },
  ole_miss: { id: "ole_miss", cfbdTeamId: 145, displayName: "Ole Miss", abbreviation: "MISS", primaryColor: "#14213D", secondaryColor: "#CE1126" },
  south_carolina: { id: "south_carolina", cfbdTeamId: 2579, displayName: "South Carolina", abbreviation: "SC", primaryColor: "#73000A", secondaryColor: "#FFFFFF" },
  tennessee: { id: "tennessee", cfbdTeamId: 2633, displayName: "Tennessee", abbreviation: "TENN", primaryColor: "#FF8200", secondaryColor: "#FFFFFF" },
  texas: { id: "texas", cfbdTeamId: 251, displayName: "Texas", abbreviation: "TEX", primaryColor: "#BF5700", secondaryColor: "#FFFFFF" },
  texas_am: { id: "texas_am", cfbdTeamId: 245, displayName: "Texas A&M", abbreviation: "TAMU", primaryColor: "#500000", secondaryColor: "#FFFFFF" },
  vanderbilt: { id: "vanderbilt", cfbdTeamId: 238, displayName: "Vanderbilt", abbreviation: "VAN", primaryColor: "#000000", secondaryColor: "#CFAE70" },
  illinois: {
    id: "illinois",
    cfbdTeamId: 356,
    displayName: "Illinois",
    abbreviation: "ILL",
    primaryColor: "#E84A27",
    secondaryColor: "#13294B",
  },
  indiana: {
    id: "indiana",
    cfbdTeamId: 84,
    displayName: "Indiana",
    abbreviation: "IND",
    primaryColor: "#990000",
    secondaryColor: "#EEEDEB",
  },
  iowa: {
    id: "iowa",
    cfbdTeamId: 2294,
    displayName: "Iowa",
    abbreviation: "IOWA",
    primaryColor: "#FFCD00",
    secondaryColor: "#000000",
  },
  maryland: {
    id: "maryland",
    cfbdTeamId: 120,
    displayName: "Maryland",
    abbreviation: "MD",
    primaryColor: "#E03A3E",
    secondaryColor: "#FFD520",
  },
  osu: {
    id: "osu",
    cfbdTeamId: 194,
    displayName: "Ohio State",
    abbreviation: "OSU",
    primaryColor: "#BA0C2F",
    secondaryColor: "#A7B1B7",
  },
  michigan: {
    id: "michigan",
    cfbdTeamId: 130,
    displayName: "Michigan",
    abbreviation: "MICH",
    primaryColor: "#00274C",
    secondaryColor: "#FFCB05",
  },
  michigan_state: {
    id: "michigan_state",
    cfbdTeamId: 127,
    displayName: "Michigan State",
    abbreviation: "MSU",
    primaryColor: "#18453B",
    secondaryColor: "#FFFFFF",
  },
  minnesota: {
    id: "minnesota",
    cfbdTeamId: 135,
    displayName: "Minnesota",
    abbreviation: "MINN",
    primaryColor: "#7A0019",
    secondaryColor: "#FFCC33",
  },
  nebraska: {
    id: "nebraska",
    cfbdTeamId: 158,
    displayName: "Nebraska",
    abbreviation: "NEB",
    primaryColor: "#E41C38",
    secondaryColor: "#FFFFFF",
  },
  northwestern: {
    id: "northwestern",
    cfbdTeamId: 77,
    displayName: "Northwestern",
    abbreviation: "NW",
    primaryColor: "#4E2A84",
    secondaryColor: "#FFFFFF",
  },
  oregon: {
    id: "oregon",
    cfbdTeamId: 2483,
    displayName: "Oregon",
    abbreviation: "ORE",
    primaryColor: "#154733",
    secondaryColor: "#FEE123",
  },
  penn_state: {
    id: "penn_state",
    cfbdTeamId: 213,
    displayName: "Penn State",
    abbreviation: "PSU",
    primaryColor: "#041E42",
    secondaryColor: "#FFFFFF",
  },
  purdue: {
    id: "purdue",
    cfbdTeamId: 2509,
    displayName: "Purdue",
    abbreviation: "PUR",
    primaryColor: "#CEB888",
    secondaryColor: "#000000",
  },
  rutgers: {
    id: "rutgers",
    cfbdTeamId: 164,
    displayName: "Rutgers",
    abbreviation: "RUTG",
    primaryColor: "#CC0033",
    secondaryColor: "#FFFFFF",
  },
  ucla: {
    id: "ucla",
    cfbdTeamId: 26,
    displayName: "UCLA",
    abbreviation: "UCLA",
    primaryColor: "#2D68C4",
    secondaryColor: "#F2A900",
  },
  usc: {
    id: "usc",
    cfbdTeamId: 30,
    displayName: "USC",
    abbreviation: "USC",
    primaryColor: "#990000",
    secondaryColor: "#FFC72C",
  },
  washington: {
    id: "washington",
    cfbdTeamId: 264,
    displayName: "Washington",
    abbreviation: "WASH",
    primaryColor: "#4B2E83",
    secondaryColor: "#B7A57A",
  },
  wisconsin: {
    id: "wisconsin",
    cfbdTeamId: 275,
    displayName: "Wisconsin",
    abbreviation: "WIS",
    primaryColor: "#C5050C",
    secondaryColor: "#FFFFFF",
  },
};

export function getCollegeProfile(id: string) {
  return COLLEGE_PROFILES[id.toLowerCase()] ?? null;
}

export function getCollegeProfileIds() {
  return Object.keys(COLLEGE_PROFILES);
}
