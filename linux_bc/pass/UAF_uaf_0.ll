; ModuleID = 'linux_bc/pass/UAF_uaf_0.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/UAF_uaf_0.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !13 {
entry:
  %retval = alloca i32, align 4
  %data = alloca i32*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = alloca i8, i64 8, align 16, !dbg !19
  %1 = bitcast i8* %0 to i32*, !dbg !20
  store i32* %1, i32** %data, align 8, !dbg !18
  %2 = load i32*, i32** %data, align 8, !dbg !21
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !21
  store i32 0, i32* %arrayidx, align 4, !dbg !22
  %3 = load i32*, i32** %data, align 8, !dbg !23
  %arrayidx1 = getelementptr inbounds i32, i32* %3, i64 1, !dbg !23
  store i32 1, i32* %arrayidx1, align 4, !dbg !24
  %4 = load i32*, i32** %data, align 8, !dbg !25
  %arrayidx2 = getelementptr inbounds i32, i32* %4, i64 1, !dbg !25
  %5 = load i32, i32* %arrayidx2, align 4, !dbg !25
  %cmp = icmp ne i32 %5, 1, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  %6 = load i32*, i32** %data, align 8, !dbg !29
  %7 = bitcast i32* %6 to i8*, !dbg !29
  call void @free(i8* %7) #4, !dbg !31
  store i32* null, i32** %data, align 8, !dbg !32
  br label %if.end, !dbg !33

if.end:                                           ; preds = %if.then, %entry
  %8 = load i32*, i32** %data, align 8, !dbg !34
  %cmp3 = icmp ne i32* %8, null, !dbg !35
  %conv = zext i1 %cmp3 to i32, !dbg !35
  %call = call i32 (i32, ...) bitcast (i32 (...)* @svf_assert to i32 (i32, ...)*)(i32 %conv), !dbg !36
  ret i32 0, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

declare dso_local i32 @svf_assert(...) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/UAF_uaf_0.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 14, type: !15, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "src/pass/UAF_uaf_0.c", directory: "/home/SVF-tools/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{!5}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 15, type: !4)
!18 = !DILocation(line: 15, column: 11, scope: !13)
!19 = !DILocation(line: 15, column: 25, scope: !13)
!20 = !DILocation(line: 15, column: 18, scope: !13)
!21 = !DILocation(line: 16, column: 5, scope: !13)
!22 = !DILocation(line: 16, column: 13, scope: !13)
!23 = !DILocation(line: 17, column: 5, scope: !13)
!24 = !DILocation(line: 17, column: 13, scope: !13)
!25 = !DILocation(line: 18, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !13, file: !14, line: 18, column: 9)
!27 = !DILocation(line: 18, column: 17, scope: !26)
!28 = !DILocation(line: 18, column: 9, scope: !13)
!29 = !DILocation(line: 19, column: 14, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !14, line: 18, column: 23)
!31 = !DILocation(line: 19, column: 9, scope: !30)
!32 = !DILocation(line: 20, column: 14, scope: !30)
!33 = !DILocation(line: 21, column: 5, scope: !30)
!34 = !DILocation(line: 22, column: 16, scope: !13)
!35 = !DILocation(line: 22, column: 21, scope: !13)
!36 = !DILocation(line: 22, column: 5, scope: !13)
!37 = !DILocation(line: 23, column: 5, scope: !13)
