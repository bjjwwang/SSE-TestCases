; ModuleID = 'mac_bc/pass/UAF_uaf_0.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/UAF_uaf_0.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !13 {
entry:
  %retval = alloca i32, align 4
  %data = alloca i32*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = alloca i8, i64 8, align 16, !dbg !20
  %1 = bitcast i8* %0 to i32*, !dbg !21
  store i32* %1, i32** %data, align 8, !dbg !19
  %2 = load i32*, i32** %data, align 8, !dbg !22
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !22
  store i32 0, i32* %arrayidx, align 4, !dbg !23
  %3 = load i32*, i32** %data, align 8, !dbg !24
  %arrayidx1 = getelementptr inbounds i32, i32* %3, i64 1, !dbg !24
  store i32 1, i32* %arrayidx1, align 4, !dbg !25
  %4 = load i32*, i32** %data, align 8, !dbg !26
  %arrayidx2 = getelementptr inbounds i32, i32* %4, i64 1, !dbg !26
  %5 = load i32, i32* %arrayidx2, align 4, !dbg !26
  %cmp = icmp ne i32 %5, 1, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  %6 = load i32*, i32** %data, align 8, !dbg !30
  %7 = bitcast i32* %6 to i8*, !dbg !30
  call void @free(i8* noundef %7), !dbg !32
  store i32* null, i32** %data, align 8, !dbg !33
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %entry
  %8 = load i32*, i32** %data, align 8, !dbg !35
  %cmp3 = icmp ne i32* %8, null, !dbg !36
  %conv = zext i1 %cmp3 to i32, !dbg !36
  %call = call i32 (i32, ...) bitcast (i32 (...)* @svf_assert to i32 (i32, ...)*)(i32 noundef %conv), !dbg !37
  ret i32 0, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @free(i8* noundef) #2

declare i32 @svf_assert(...) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/UAF_uaf_0.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"Homebrew clang version 14.0.6"}
!13 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 14, type: !15, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/pass/UAF_uaf_0.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{!4}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 15, type: !3)
!19 = !DILocation(line: 15, column: 11, scope: !13)
!20 = !DILocation(line: 15, column: 25, scope: !13)
!21 = !DILocation(line: 15, column: 18, scope: !13)
!22 = !DILocation(line: 16, column: 5, scope: !13)
!23 = !DILocation(line: 16, column: 13, scope: !13)
!24 = !DILocation(line: 17, column: 5, scope: !13)
!25 = !DILocation(line: 17, column: 13, scope: !13)
!26 = !DILocation(line: 18, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !13, file: !14, line: 18, column: 9)
!28 = !DILocation(line: 18, column: 17, scope: !27)
!29 = !DILocation(line: 18, column: 9, scope: !13)
!30 = !DILocation(line: 19, column: 14, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !14, line: 18, column: 23)
!32 = !DILocation(line: 19, column: 9, scope: !31)
!33 = !DILocation(line: 20, column: 14, scope: !31)
!34 = !DILocation(line: 21, column: 5, scope: !31)
!35 = !DILocation(line: 22, column: 16, scope: !13)
!36 = !DILocation(line: 22, column: 21, scope: !13)
!37 = !DILocation(line: 22, column: 5, scope: !13)
!38 = !DILocation(line: 23, column: 5, scope: !13)
