; ModuleID = 'mac_bc/pass/cwe121_int64_alloc.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/cwe121_int64_alloc.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !14 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = alloca i8, i64 32, align 16, !dbg !24
  %1 = bitcast i8* %0 to i64*, !dbg !25
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !23
  %2 = load i64*, i64** %dataBadBuffer, align 8, !dbg !26
  store i64* %2, i64** %data, align 8, !dbg !27
  %3 = load i64*, i64** %data, align 8, !dbg !28
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 0, !dbg !28
  store i64 10, i64* %arrayidx, align 8, !dbg !29
  %4 = load i64*, i64** %data, align 8, !dbg !30
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 1, !dbg !30
  store i64 11, i64* %arrayidx1, align 8, !dbg !31
  %5 = load i64*, i64** %data, align 8, !dbg !32
  %arrayidx2 = getelementptr inbounds i64, i64* %5, i64 2, !dbg !32
  store i64 12, i64* %arrayidx2, align 8, !dbg !33
  %6 = load i64*, i64** %data, align 8, !dbg !34
  %arrayidx3 = getelementptr inbounds i64, i64* %6, i64 1, !dbg !34
  %7 = load i64, i64* %arrayidx3, align 8, !dbg !34
  %cmp = icmp eq i64 %7, 11, !dbg !35
  call void @svf_assert(i1 noundef zeroext %cmp), !dbg !36
  ret i32 0, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/cwe121_int64_alloc.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !5, line: 30, baseType: !6)
!5 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_int64_t.h", directory: "")
!6 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 7, type: !16, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!15 = !DIFile(filename: "src/pass/cwe121_int64_alloc.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{!18}
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 8, type: !3)
!21 = !DILocation(line: 8, column: 15, scope: !14)
!22 = !DILocalVariable(name: "dataBadBuffer", scope: !14, file: !15, line: 9, type: !3)
!23 = !DILocation(line: 9, column: 15, scope: !14)
!24 = !DILocation(line: 9, column: 42, scope: !14)
!25 = !DILocation(line: 9, column: 31, scope: !14)
!26 = !DILocation(line: 12, column: 12, scope: !14)
!27 = !DILocation(line: 12, column: 10, scope: !14)
!28 = !DILocation(line: 13, column: 5, scope: !14)
!29 = !DILocation(line: 13, column: 13, scope: !14)
!30 = !DILocation(line: 14, column: 5, scope: !14)
!31 = !DILocation(line: 14, column: 13, scope: !14)
!32 = !DILocation(line: 15, column: 5, scope: !14)
!33 = !DILocation(line: 15, column: 13, scope: !14)
!34 = !DILocation(line: 16, column: 16, scope: !14)
!35 = !DILocation(line: 16, column: 24, scope: !14)
!36 = !DILocation(line: 16, column: 5, scope: !14)
!37 = !DILocation(line: 17, column: 1, scope: !14)
