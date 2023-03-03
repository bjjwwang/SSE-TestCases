; ModuleID = 'mac_bc/paper_case/test2.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/paper_case/test2.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01_bad() #0 !dbg !9 {
entry:
  %buffer = alloca [10 x i32], align 16
  %data = alloca i32*, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !14, metadata !DIExpression()), !dbg !19
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !19
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !19
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32* %a, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i32* %b, metadata !25, metadata !DIExpression()), !dbg !26
  store i32* %a, i32** %data, align 8, !dbg !27
  store i32 3, i32* %a, align 4, !dbg !28
  %1 = load i32*, i32** %data, align 8, !dbg !29
  %2 = load i32, i32* %1, align 4, !dbg !30
  %idxprom = sext i32 %2 to i64, !dbg !31
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !31
  store i32 1, i32* %arrayidx, align 4, !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01_good() #0 !dbg !34 {
entry:
  %buffer = alloca [10 x i32], align 16
  %data = alloca i32*, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !35, metadata !DIExpression()), !dbg !36
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !36
  call void @llvm.dbg.declare(metadata i32** %data, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i32* %a, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i32* %b, metadata !41, metadata !DIExpression()), !dbg !42
  store i32* %a, i32** %data, align 8, !dbg !43
  store i32 10, i32* %a, align 4, !dbg !44
  %1 = load i32*, i32** %data, align 8, !dbg !45
  %2 = load i32, i32* %1, align 4, !dbg !46
  %idxprom = sext i32 %2 to i64, !dbg !47
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !47
  store i32 1, i32* %arrayidx, align 4, !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !50 {
entry:
  %fun_ptr = alloca void (...)*, align 8
  call void @llvm.dbg.declare(metadata void (...)** %fun_ptr, metadata !53, metadata !DIExpression()), !dbg !57
  store void (...)* bitcast (void ()* @CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01_bad to void (...)*), void (...)** %fun_ptr, align 8, !dbg !57
  %0 = load void (...)*, void (...)** %fun_ptr, align 8, !dbg !58
  call void (...) %0(), !dbg !59
  ret i32 0, !dbg !60
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/paper_case/test2.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01_bad", scope: !10, file: !10, line: 5, type: !11, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!10 = !DIFile(filename: "src/paper_case/test2.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !{}
!14 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 7, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !17)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !{!18}
!18 = !DISubrange(count: 10)
!19 = !DILocation(line: 7, column: 9, scope: !9)
!20 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 8, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!22 = !DILocation(line: 8, column: 10, scope: !9)
!23 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 9, type: !16)
!24 = !DILocation(line: 9, column: 9, scope: !9)
!25 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 9, type: !16)
!26 = !DILocation(line: 9, column: 12, scope: !9)
!27 = !DILocation(line: 10, column: 10, scope: !9)
!28 = !DILocation(line: 11, column: 7, scope: !9)
!29 = !DILocation(line: 12, column: 13, scope: !9)
!30 = !DILocation(line: 12, column: 12, scope: !9)
!31 = !DILocation(line: 12, column: 5, scope: !9)
!32 = !DILocation(line: 12, column: 19, scope: !9)
!33 = !DILocation(line: 13, column: 1, scope: !9)
!34 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fscanf_01_good", scope: !10, file: !10, line: 15, type: !11, scopeLine: 16, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!35 = !DILocalVariable(name: "buffer", scope: !34, file: !10, line: 17, type: !15)
!36 = !DILocation(line: 17, column: 9, scope: !34)
!37 = !DILocalVariable(name: "data", scope: !34, file: !10, line: 18, type: !21)
!38 = !DILocation(line: 18, column: 10, scope: !34)
!39 = !DILocalVariable(name: "a", scope: !34, file: !10, line: 19, type: !16)
!40 = !DILocation(line: 19, column: 9, scope: !34)
!41 = !DILocalVariable(name: "b", scope: !34, file: !10, line: 19, type: !16)
!42 = !DILocation(line: 19, column: 12, scope: !34)
!43 = !DILocation(line: 20, column: 10, scope: !34)
!44 = !DILocation(line: 21, column: 7, scope: !34)
!45 = !DILocation(line: 22, column: 13, scope: !34)
!46 = !DILocation(line: 22, column: 12, scope: !34)
!47 = !DILocation(line: 22, column: 5, scope: !34)
!48 = !DILocation(line: 22, column: 19, scope: !34)
!49 = !DILocation(line: 23, column: 1, scope: !34)
!50 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 25, type: !51, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!51 = !DISubroutineType(types: !52)
!52 = !{!16}
!53 = !DILocalVariable(name: "fun_ptr", scope: !50, file: !10, line: 26, type: !54)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DISubroutineType(types: !56)
!56 = !{null, null}
!57 = !DILocation(line: 26, column: 12, scope: !50)
!58 = !DILocation(line: 27, column: 7, scope: !50)
!59 = !DILocation(line: 27, column: 5, scope: !50)
!60 = !DILocation(line: 28, column: 1, scope: !50)
