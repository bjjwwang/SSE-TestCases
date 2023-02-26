; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Memcpy_Overrun_ArrayIndex_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Memcpy_Overrun_ArrayIndex_01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.testStruct = type { i32* }

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [5 x i32], align 16
  %x = alloca i32, align 4
  %s1 = alloca %struct.testStruct, align 8
  %s2 = alloca %struct.testStruct, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %buffer, metadata !15, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %x, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 -1, i32* %x, align 4, !dbg !21
  call void @llvm.dbg.declare(metadata %struct.testStruct* %s1, metadata !22, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata %struct.testStruct* %s2, metadata !28, metadata !DIExpression()), !dbg !29
  %a = getelementptr inbounds %struct.testStruct, %struct.testStruct* %s1, i32 0, i32 0, !dbg !30
  store i32* %x, i32** %a, align 8, !dbg !31
  %0 = bitcast %struct.testStruct* %s2 to i8*, !dbg !32
  %1 = bitcast %struct.testStruct* %s1 to i8*, !dbg !32
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %0, i8* align 8 %1, i64 8, i1 false), !dbg !32
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !33
  call void @srand(i32 noundef %call), !dbg !34
  %call1 = call i32 @rand(), !dbg !35
  %rem = srem i32 %call1, 10, !dbg !36
  %a2 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %s1, i32 0, i32 0, !dbg !37
  %2 = load i32*, i32** %a2, align 8, !dbg !37
  store i32 %rem, i32* %2, align 4, !dbg !38
  %a3 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %s2, i32 0, i32 0, !dbg !39
  %3 = load i32*, i32** %a3, align 8, !dbg !39
  %4 = load i32, i32* %3, align 4, !dbg !41
  %a4 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %s1, i32 0, i32 0, !dbg !42
  %5 = load i32*, i32** %a4, align 8, !dbg !42
  %6 = load i32, i32* %5, align 4, !dbg !43
  %cmp = icmp eq i32 %4, %6, !dbg !44
  br i1 %cmp, label %if.then, label %if.end, !dbg !45

if.then:                                          ; preds = %entry
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 5, !dbg !46
  store i32 1, i32* %arrayidx, align 4, !dbg !48
  br label %if.end, !dbg !49

if.end:                                           ; preds = %if.then, %entry
  %7 = load i32, i32* %retval, align 4, !dbg !50
  ret i32 %7, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare void @srand(i32 noundef) #3

declare i32 @time(...) #3

declare i32 @rand() #3

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Memcpy_Overrun_ArrayIndex_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 11, type: !11, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Memcpy_Overrun_ArrayIndex_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 12, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 160, elements: !17)
!17 = !{!18}
!18 = !DISubrange(count: 5)
!19 = !DILocation(line: 12, column: 6, scope: !9)
!20 = !DILocalVariable(name: "x", scope: !9, file: !10, line: 13, type: !13)
!21 = !DILocation(line: 13, column: 9, scope: !9)
!22 = !DILocalVariable(name: "s1", scope: !9, file: !10, line: 14, type: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "testStruct", file: !10, line: 7, size: 64, elements: !24)
!24 = !{!25}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !23, file: !10, line: 8, baseType: !26, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!27 = !DILocation(line: 14, column: 23, scope: !9)
!28 = !DILocalVariable(name: "s2", scope: !9, file: !10, line: 15, type: !23)
!29 = !DILocation(line: 15, column: 23, scope: !9)
!30 = !DILocation(line: 16, column: 8, scope: !9)
!31 = !DILocation(line: 16, column: 10, scope: !9)
!32 = !DILocation(line: 17, column: 5, scope: !9)
!33 = !DILocation(line: 18, column: 11, scope: !9)
!34 = !DILocation(line: 18, column: 5, scope: !9)
!35 = !DILocation(line: 19, column: 12, scope: !9)
!36 = !DILocation(line: 19, column: 19, scope: !9)
!37 = !DILocation(line: 19, column: 7, scope: !9)
!38 = !DILocation(line: 19, column: 10, scope: !9)
!39 = !DILocation(line: 20, column: 13, scope: !40)
!40 = distinct !DILexicalBlock(scope: !9, file: !10, line: 20, column: 8)
!41 = !DILocation(line: 20, column: 8, scope: !40)
!42 = !DILocation(line: 20, column: 24, scope: !40)
!43 = !DILocation(line: 20, column: 19, scope: !40)
!44 = !DILocation(line: 20, column: 16, scope: !40)
!45 = !DILocation(line: 20, column: 8, scope: !9)
!46 = !DILocation(line: 21, column: 3, scope: !47)
!47 = distinct !DILexicalBlock(scope: !40, file: !10, line: 20, column: 28)
!48 = !DILocation(line: 21, column: 13, scope: !47)
!49 = !DILocation(line: 22, column: 2, scope: !47)
!50 = !DILocation(line: 23, column: 1, scope: !9)
