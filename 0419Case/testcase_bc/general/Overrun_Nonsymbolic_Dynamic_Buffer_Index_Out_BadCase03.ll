; ModuleID = '/Users/jiaweiwang/CLionProjects/0419Case/testcase_bc/general/Overrun_Nonsymbolic_Dynamic_Buffer_Index_Out_BadCase03.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0419Case/general/Overrun_Nonsymbolic_Dynamic_Buffer_Index_Out_BadCase03.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.SS = type { i32, i32 }

@s1 = global %struct.SS zeroinitializer, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @TestCaseBad03(i32 noundef %n, i32 noundef %i) #0 !dbg !18 {
entry:
  %n.addr = alloca i32, align 4
  %i.addr = alloca i32, align 4
  %p = alloca %struct.SS*, align 8
  %obj = alloca %struct.SS, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !22, metadata !DIExpression()), !dbg !23
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata %struct.SS** %p, metadata !26, metadata !DIExpression()), !dbg !28
  %0 = load i32, i32* %n.addr, align 4, !dbg !29
  %conv = sext i32 %0 to i64, !dbg !29
  %mul = mul i64 %conv, 8, !dbg !30
  %call = call i8* @malloc(i64 noundef %mul) #4, !dbg !31
  %1 = bitcast i8* %call to %struct.SS*, !dbg !31
  store %struct.SS* %1, %struct.SS** %p, align 8, !dbg !28
  %2 = load i32, i32* %i.addr, align 4, !dbg !32
  %3 = load i32, i32* %n.addr, align 4, !dbg !34
  %cmp = icmp sle i32 %2, %3, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct.SS* %obj, metadata !37, metadata !DIExpression()), !dbg !39
  %a = getelementptr inbounds %struct.SS, %struct.SS* %obj, i32 0, i32 0, !dbg !40
  store i32 0, i32* %a, align 4, !dbg !41
  %b = getelementptr inbounds %struct.SS, %struct.SS* %obj, i32 0, i32 1, !dbg !42
  store i32 0, i32* %b, align 4, !dbg !43
  %4 = load %struct.SS*, %struct.SS** %p, align 8, !dbg !44
  %5 = load i32, i32* %i.addr, align 4, !dbg !45
  %idxprom = sext i32 %5 to i64, !dbg !44
  %arrayidx = getelementptr inbounds %struct.SS, %struct.SS* %4, i64 %idxprom, !dbg !44
  %6 = bitcast %struct.SS* %arrayidx to i8*, !dbg !46
  %7 = bitcast %struct.SS* %obj to i8*, !dbg !46
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 4 %7, i64 8, i1 false), !dbg !46
  br label %if.end, !dbg !47

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { allocsize(0) }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "s1", scope: !2, file: !5, line: 10, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0419Case/general/Overrun_Nonsymbolic_Dynamic_Buffer_Index_Out_BadCase03.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!4 = !{!0}
!5 = !DIFile(filename: "general/Overrun_Nonsymbolic_Dynamic_Buffer_Index_Out_BadCase03.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!6 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "SS", file: !5, line: 7, size: 64, elements: !7)
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !6, file: !5, line: 8, baseType: !9, size: 32)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !6, file: !5, line: 9, baseType: !9, size: 32, offset: 32)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = distinct !DISubprogram(name: "TestCaseBad03", scope: !5, file: !5, line: 16, type: !19, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null, !9, !9}
!21 = !{}
!22 = !DILocalVariable(name: "n", arg: 1, scope: !18, file: !5, line: 16, type: !9)
!23 = !DILocation(line: 16, column: 24, scope: !18)
!24 = !DILocalVariable(name: "i", arg: 2, scope: !18, file: !5, line: 16, type: !9)
!25 = !DILocation(line: 16, column: 31, scope: !18)
!26 = !DILocalVariable(name: "p", scope: !18, file: !5, line: 18, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!28 = !DILocation(line: 18, column: 17, scope: !18)
!29 = !DILocation(line: 18, column: 28, scope: !18)
!30 = !DILocation(line: 18, column: 30, scope: !18)
!31 = !DILocation(line: 18, column: 21, scope: !18)
!32 = !DILocation(line: 19, column: 9, scope: !33)
!33 = distinct !DILexicalBlock(scope: !18, file: !5, line: 19, column: 9)
!34 = !DILocation(line: 19, column: 14, scope: !33)
!35 = !DILocation(line: 19, column: 11, scope: !33)
!36 = !DILocation(line: 19, column: 9, scope: !18)
!37 = !DILocalVariable(name: "obj", scope: !38, file: !5, line: 20, type: !6)
!38 = distinct !DILexicalBlock(scope: !33, file: !5, line: 19, column: 17)
!39 = !DILocation(line: 20, column: 19, scope: !38)
!40 = !DILocation(line: 21, column: 13, scope: !38)
!41 = !DILocation(line: 21, column: 15, scope: !38)
!42 = !DILocation(line: 22, column: 13, scope: !38)
!43 = !DILocation(line: 22, column: 15, scope: !38)
!44 = !DILocation(line: 24, column: 9, scope: !38)
!45 = !DILocation(line: 24, column: 11, scope: !38)
!46 = !DILocation(line: 24, column: 16, scope: !38)
!47 = !DILocation(line: 25, column: 5, scope: !38)
!48 = !DILocation(line: 26, column: 1, scope: !18)
