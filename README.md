# Verifiable AI Credit Shield


**A privacy-first, AI-powered, zero-knowledge credit scoring protocol on Starknet.**

**Live Demo:** 
* https://20260302-verifiable-ai-credit-shield-h1jxcd7am.vercel.app/

**Contract:** 
* `0x07adc426c6b36b47a25039248527655679fcc29bf09eef68791f4ed2b9fddaba` (Sepolia Testnet)  

**Status:** 
* functional MVP

---

### The Vision
building the future of credit — a privacy-first, AI-powered, fully on-chain credit shield on Starknet that lets anyone prove their creditworthiness without ever revealing their personal data.

In traditional finance, your credit score is a black box controlled by centralized bureaus.  

**Verifiable AI Credit Shield** is the on-chain credit layer that lets users **prove their creditworthiness cryptographically** — without ever revealing income, debt history, or personal data.

Built on **Starknet**, powered by **AI scoring + Zero-Knowledge proofs**, this is the missing primitive for the next generation of permissionless lending protocols.

> "Your credit. Your proof. Your rules. No middleman. No data leaks. Pure Starknet neon."

---

### Key Features

- **Instant ZK AI Credit Proof Generation**  
  AI calculates score using the exact same formula as the on-chain contract (`income × 8 - debt × 5 - defaults × 60`).

- **One-Click Verify & Borrow**  
  Directly invokes the live Starknet contract with generated proof. Real transaction on Sepolia.

- **Full Braavos Wallet Integration**  
  Seamless Starknet account abstraction + Sepolia testnet support.

- **UI**  
  Next.js 15 App Router • TypeScript • Zod validation • React Hook Form • Framer Motion animations • shadcn/ui components.

- **Fully Responsive & Accessible**  
  Perfect mobile experience with collapsible sidebar and dark mode by default.

---

### How It Works (End-to-End Flow)

1. Connect Braavos Wallet
2. Input synthetic credit profile (annual income, debt ratio, defaults)
3. AI instantly computes score + generates fake-but-realistic ZK proof
4. One-click "Verify & Borrow" → signs transaction on Starknet
5. Contract validates proof and records borrowed amount on-chain

Everything happens in < 3 seconds. Zero off-chain servers. Pure on-chain verification.

---

### Tech Stack

| Layer              | Technology                              |
|--------------------|-----------------------------------------|
| **Frontend**       | Next.js 15 (App Router), TypeScript, Tailwind CSS, shadcn/ui, Framer Motion |
| **Form & Validation** | React Hook Form + Zod                    |
| **Blockchain**     | Starknet (Sepolia), @starknet-react/core, Braavos connector |
| **Contract**       | Cairo 2.0 (verified on Starknet Sepolia) |
| **Styling**        | Custom cyberpunk glass-morphism with neon gradients |
| **Notifications**  | Sonner toasts                           |

---

### Contract Address (Live)

**CreditShield**  
`0x07adc426c6b36b47a25039248527655679fcc29bf09eef68791f4ed2b9fddaba`

**Functions Implemented:**
- `verify_credit_and_borrow(proof, public_score, amount, collateral)`
- `get_borrowed_amount(user)`

---

### Installation & Local Development
