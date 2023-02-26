; ModuleID = 'mac_bc/pass/cwe121_char_alloc.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/cwe121_char_alloc.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !12 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 4, align 16, !dbg !22
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !21
  %1 = load i8*, i8** %dataBadBuffer, align 8, !dbg !23
  store i8* %1, i8** %data, align 8, !dbg !24
  %2 = load i8*, i8** %data, align 8, !dbg !25
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !25
  store i8 65, i8* %arrayidx, align 1, !dbg !26
  %3 = load i8*, i8** %data, align 8, !dbg !27
  %arrayidx1 = getelementptr inbounds i8, i8* %3, i64 1, !dbg !27
  store i8 65, i8* %arrayidx1, align 1, !dbg !28
  %4 = load i8*, i8** %data, align 8, !dbg !29
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 2, !dbg !29
  store i8 65, i8* %arrayidx2, align 1, !dbg !30
  %5 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx3 = getelementptr inbounds i8, i8* %5, i64 1, !dbg !31
  %6 = load i8, i8* %arrayidx3, align 1, !dbg !31
  %conv = sext i8 %6 to i32, !dbg !31
  %cmp = icmp eq i32 %conv, 65, !dbg !32
  call void @svf_assert(i1 noundef zeroext %cmp), !dbg !33
  ret i32 0, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/cwe121_char_alloc.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"PIC Level", i32 2}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"Homebrew clang version 14.0.6"}
!12 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 8, type: !14, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!13 = !DIFile(filename: "src/pass/cwe121_char_alloc.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!14 = !DISubroutineType(types: !15)
!15 = !{!16}
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 9, type: !3)
!19 = !DILocation(line: 9, column: 12, scope: !12)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !12, file: !13, line: 10, type: !3)
!21 = !DILocation(line: 10, column: 12, scope: !12)
!22 = !DILocation(line: 10, column: 36, scope: !12)
!23 = !DILocation(line: 13, column: 12, scope: !12)
!24 = !DILocation(line: 13, column: 10, scope: !12)
!25 = !DILocation(line: 14, column: 5, scope: !12)
!26 = !DILocation(line: 14, column: 13, scope: !12)
!27 = !DILocation(line: 15, column: 5, scope: !12)
!28 = !DILocation(line: 15, column: 13, scope: !12)
!29 = !DILocation(line: 16, column: 5, scope: !12)
!30 = !DILocation(line: 16, column: 13, scope: !12)
!31 = !DILocation(line: 17, column: 16, scope: !12)
!32 = !DILocation(line: 17, column: 24, scope: !12)
!33 = !DILocation(line: 17, column: 5, scope: !12)
!34 = !DILocation(line: 18, column: 1, scope: !12)
