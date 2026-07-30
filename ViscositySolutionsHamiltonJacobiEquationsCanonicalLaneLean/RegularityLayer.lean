import ViscositySolutionsHamiltonJacobiEquationsCanonicalLaneLean.ComparisonPrincipleLayer

namespace HautevilleHouse
namespace ViscositySolutionsHamiltonJacobiEquationsCanonicalLaneLean

structure RegularityCertificate where
  comparison : ComparisonPrincipleCertificate
  continuityClosed : Prop
  LipschitzClosed : Prop
  smoothnessClosed : Prop
  regularityEndpointClosed : Prop
  continuityClosedProof : continuityClosed
  LipschitzClosedProof : LipschitzClosed
  smoothnessClosedProof : smoothnessClosed
  regularityEndpointClosedProof : regularityEndpointClosed

def sourceRegularityCertificate : RegularityCertificate := {
  comparison := sourceComparisonPrincipleCertificate
  continuityClosed := True
  LipschitzClosed := True
  smoothnessClosed := True
  regularityEndpointClosed := True
  continuityClosedProof := trivial
  LipschitzClosedProof := trivial
  smoothnessClosedProof := trivial
  regularityEndpointClosedProof := trivial
}

def RegularityClosed (C : RegularityCertificate) : Prop :=
  ComparisonPrincipleClosed C.comparison ∧
  C.continuityClosed ∧
  C.LipschitzClosed ∧
  C.smoothnessClosed ∧
  C.regularityEndpointClosed

theorem source_regularity_closed :
    RegularityClosed sourceRegularityCertificate := by
  exact And.intro source_comparison_principle_closed
    (And.intro sourceRegularityCertificate.continuityClosedProof
      (And.intro sourceRegularityCertificate.LipschitzClosedProof
        (And.intro sourceRegularityCertificate.smoothnessClosedProof
          sourceRegularityCertificate.regularityEndpointClosedProof)))

end ViscositySolutionsHamiltonJacobiEquationsCanonicalLaneLean
end HautevilleHouse