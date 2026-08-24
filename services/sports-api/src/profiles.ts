export type CollegeProfile = {
  id: string;
  cfbdTeamId: number;
  displayName: string;
  abbreviation: string;
  primaryColor: string;
  secondaryColor: string;
};

const COLLEGE_PROFILES: Record<string, CollegeProfile> = {
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
};

export function getCollegeProfile(id: string) {
  return COLLEGE_PROFILES[id.toLowerCase()] ?? null;
}

export function getCollegeProfileIds() {
  return Object.keys(COLLEGE_PROFILES);
}
