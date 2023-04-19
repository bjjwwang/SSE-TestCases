; ModuleID = '/Users/jiaweiwang/CLionProjects/0419Case/testcase_bc/general/OverRun_BadCase_whitebox09.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0419Case/general/OverRun_BadCase_whitebox09.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.BeamList = type { [8 x i32] }

; Function Attrs: noinline nounwind optnone ssp uwtable
define zeroext i8 @OverRun_BadCase_whitebox09(%struct.BeamList* noundef %info) #0 !dbg !11 {
entry:
  %retval = alloca i8, align 1
  %info.addr = alloca %struct.BeamList*, align 8
  %beamCount = alloca i8, align 1
  %index = alloca i8, align 1
  %beamNum = alloca i32*, align 8
  store %struct.BeamList* %info, %struct.BeamList** %info.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.BeamList** %info.addr, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = load %struct.BeamList*, %struct.BeamList** %info.addr, align 8, !dbg !28
  %cmp = icmp eq %struct.BeamList* %0, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  store i8 1, i8* %retval, align 1, !dbg !32
  br label %return, !dbg !32

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i8* %beamCount, metadata !34, metadata !DIExpression()), !dbg !35
  store i8 0, i8* %beamCount, align 1, !dbg !35
  call void @llvm.dbg.declare(metadata i8* %index, metadata !36, metadata !DIExpression()), !dbg !38
  store i8 0, i8* %index, align 1, !dbg !38
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i8, i8* %index, align 1, !dbg !40
  %conv = zext i8 %1 to i32, !dbg !40
  %cmp1 = icmp slt i32 %conv, 16, !dbg !42
  br i1 %cmp1, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32** %beamNum, metadata !44, metadata !DIExpression()), !dbg !47
  %2 = load %struct.BeamList*, %struct.BeamList** %info.addr, align 8, !dbg !48
  %beam = getelementptr inbounds %struct.BeamList, %struct.BeamList* %2, i32 0, i32 0, !dbg !49
  %3 = load i8, i8* %index, align 1, !dbg !50
  %idxprom = zext i8 %3 to i64, !dbg !48
  %arrayidx = getelementptr inbounds [8 x i32], [8 x i32]* %beam, i64 0, i64 %idxprom, !dbg !48
  store i32* %arrayidx, i32** %beamNum, align 8, !dbg !47
  %4 = load i32*, i32** %beamNum, align 8, !dbg !51
  %5 = load i32, i32* %4, align 4, !dbg !53
  %cmp3 = icmp ugt i32 %5, 2, !dbg !54
  br i1 %cmp3, label %if.then5, label %if.end6, !dbg !55

if.then5:                                         ; preds = %for.body
  %6 = load i8, i8* %beamCount, align 1, !dbg !56
  %inc = add i8 %6, 1, !dbg !56
  store i8 %inc, i8* %beamCount, align 1, !dbg !56
  br label %if.end6, !dbg !58

if.end6:                                          ; preds = %if.then5, %for.body
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %if.end6
  %7 = load i8, i8* %index, align 1, !dbg !60
  %inc7 = add i8 %7, 1, !dbg !60
  store i8 %inc7, i8* %index, align 1, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %8 = load i8, i8* %beamCount, align 1, !dbg !65
  store i8 %8, i8* %retval, align 1, !dbg !66
  br label %return, !dbg !66

return:                                           ; preds = %for.end, %if.then
  %9 = load i8, i8* %retval, align 1, !dbg !67
  ret i8 %9, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0419Case/general/OverRun_BadCase_whitebox09.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!2 = !{!3}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "OverRun_BadCase_whitebox09", scope: !12, file: !12, line: 13, type: !13, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !25)
!12 = !DIFile(filename: "general/OverRun_BadCase_whitebox09.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!13 = !DISubroutineType(types: !14)
!14 = !{!15, !16}
!15 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "BeamList", file: !12, line: 11, baseType: !18)
!18 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !12, line: 9, size: 256, elements: !19)
!19 = !{!20}
!20 = !DIDerivedType(tag: DW_TAG_member, name: "beam", scope: !18, file: !12, line: 10, baseType: !21, size: 256)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 256, elements: !23)
!22 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!23 = !{!24}
!24 = !DISubrange(count: 8)
!25 = !{}
!26 = !DILocalVariable(name: "info", arg: 1, scope: !11, file: !12, line: 13, type: !16)
!27 = !DILocation(line: 13, column: 52, scope: !11)
!28 = !DILocation(line: 15, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !11, file: !12, line: 15, column: 9)
!30 = !DILocation(line: 15, column: 14, scope: !29)
!31 = !DILocation(line: 15, column: 9, scope: !11)
!32 = !DILocation(line: 16, column: 9, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !12, line: 15, column: 23)
!34 = !DILocalVariable(name: "beamCount", scope: !11, file: !12, line: 18, type: !15)
!35 = !DILocation(line: 18, column: 19, scope: !11)
!36 = !DILocalVariable(name: "index", scope: !37, file: !12, line: 19, type: !15)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 19, column: 5)
!38 = !DILocation(line: 19, column: 24, scope: !37)
!39 = !DILocation(line: 19, column: 10, scope: !37)
!40 = !DILocation(line: 19, column: 35, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !12, line: 19, column: 5)
!42 = !DILocation(line: 19, column: 41, scope: !41)
!43 = !DILocation(line: 19, column: 5, scope: !37)
!44 = !DILocalVariable(name: "beamNum", scope: !45, file: !12, line: 21, type: !46)
!45 = distinct !DILexicalBlock(scope: !41, file: !12, line: 19, column: 62)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!47 = !DILocation(line: 21, column: 23, scope: !45)
!48 = !DILocation(line: 21, column: 35, scope: !45)
!49 = !DILocation(line: 21, column: 41, scope: !45)
!50 = !DILocation(line: 21, column: 46, scope: !45)
!51 = !DILocation(line: 22, column: 15, scope: !52)
!52 = distinct !DILexicalBlock(scope: !45, file: !12, line: 22, column: 13)
!53 = !DILocation(line: 22, column: 14, scope: !52)
!54 = !DILocation(line: 22, column: 24, scope: !52)
!55 = !DILocation(line: 22, column: 13, scope: !45)
!56 = !DILocation(line: 23, column: 22, scope: !57)
!57 = distinct !DILexicalBlock(scope: !52, file: !12, line: 22, column: 48)
!58 = !DILocation(line: 24, column: 9, scope: !57)
!59 = !DILocation(line: 25, column: 5, scope: !45)
!60 = !DILocation(line: 19, column: 53, scope: !41)
!61 = !DILocation(line: 19, column: 5, scope: !41)
!62 = distinct !{!62, !43, !63, !64}
!63 = !DILocation(line: 25, column: 5, scope: !37)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 26, column: 12, scope: !11)
!66 = !DILocation(line: 26, column: 5, scope: !11)
!67 = !DILocation(line: 27, column: 1, scope: !11)
